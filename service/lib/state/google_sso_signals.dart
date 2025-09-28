import 'dart:async';
import 'dart:convert';
import 'dart:io';

class GoogleSsoSignals {
  GoogleSsoSignals();

  // Public API (usable from gRPC and REST)
  Future<String> signInWithGoogle() async {
    // 1) Start ephemeral loopback HTTP server for the OAuth callback
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final redirectUri = 'http://127.0.0.1:${server.port}/callback';
    final codeFuture = _waitForCodeOnce(server);

    // 2) Build Google auth URL (requires client_id and a registered redirect URI)
    final cfg = await _readAuthConfig();
    final clientId = _pickClientId(cfg);
    if (clientId == null || clientId.isEmpty) {
      await _safeClose(server);
      throw Exception('Google OAuth client_id not found in auth.json');
    }

    final authUrl = Uri.https(
      'accounts.google.com',
      '/o/oauth2/v2/auth',
      {
        'client_id': clientId,
        'redirect_uri': redirectUri,
        'response_type': 'code',
        'scope': 'openid email profile',
        'access_type': 'offline',
        'prompt': 'consent',
      },
    ).toString();

    // 3) Open browser
    await _openInBrowser(authUrl);

    // 4) Wait for code from callback
    final code = await codeFuture;

    // 5) Exchange code -> tokens
    final tokens = await _exchangeCodeForToken(
      code: code,
      clientId: clientId,
      clientSecret: _pickClientSecret(cfg),
      redirectUri: redirectUri,
    );

    // 6) Persist tokens and return access token
    await _saveTokens(tokens);
    final access = tokens['access_token'] as String?;
    if (access == null || access.isEmpty) {
      throw Exception('No access_token returned from Google');
    }
    return access;
  }

  Future<bool> isLoggedIn() async {
    final tokens = await _loadTokens();
    if (tokens == null) return false;
    final access = tokens['access_token'] as String?;
    if (access == null || access.isEmpty) return false;

    // Optional expiry check (uses created_at + expires_in if present)
    final exp = _expiresAt(tokens);
    if (exp == null) return true;
    return DateTime.now().isBefore(exp.subtract(const Duration(seconds: 30)));
  }

  Future<String> getToken() async {
    final tokens = await _loadTokens();
    if (tokens == null) {
      throw Exception('Not authenticated. Please sign in.');
    }
    final access = tokens['access_token'] as String?;
    if (access == null || access.isEmpty) {
      throw Exception('Stored token invalid. Please sign in.');
    }
    return access;
  }

  Future<void> signOut() async {
    final f = File(_tokensFilePath());
    if (await f.exists()) {
      await f.delete();
    }
  }

  // ===== Internals =====

  Future<Map<String, dynamic>> _exchangeCodeForToken({
    required String code,
    required String clientId,
    String? clientSecret,
    required String redirectUri,
  }) async {
    final uri = Uri.parse('https://oauth2.googleapis.com/token');

    final form = {
      'grant_type': 'authorization_code',
      'code': code,
      'client_id': clientId,
      'redirect_uri': redirectUri,
    };
    if (clientSecret != null && clientSecret.isNotEmpty) {
      form['client_secret'] = clientSecret;
    }

    final http = HttpClient();
    try {
      final req = await http.postUrl(uri);
      req.headers.contentType = ContentType('application', 'x-www-form-urlencoded');
      req.write(form.entries
          .map((e) => '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
          .join('&'));
      final res = await req.close();
      final body = await res.transform(utf8.decoder).join();
      if (res.statusCode != 200) {
        throw Exception('Token exchange failed (${res.statusCode}): $body');
      }
      final map = jsonDecode(body) as Map<String, dynamic>;
      map['created_at'] = DateTime.now().toIso8601String();
      return map;
    } finally {
      http.close(force: true);
    }
  }

  Future<String> _waitForCodeOnce(HttpServer server) async {
    final completer = Completer<String>();

    server.listen((HttpRequest req) async {
      try {
        if (req.method == 'GET' && req.uri.path == '/callback') {
          final error = req.uri.queryParameters['error'];
          final code = req.uri.queryParameters['code'];

          if (error != null) {
            req.response
              ..statusCode = HttpStatus.ok
              ..headers.contentType = ContentType.html
              ..write('<h3>Authentication failed</h3><p>$error</p>');
            await req.response.close();
            if (!completer.isCompleted) {
              completer.completeError(StateError('Auth error: $error'));
            }
            await _safeClose(server);
            return;
          }

          if (code != null && code.isNotEmpty) {
            req.response
              ..statusCode = HttpStatus.ok
              ..headers.contentType = ContentType.html
              ..write('<h3>Authentication successful</h3><p>You can close this window.</p>');
            await req.response.close();
            if (!completer.isCompleted) completer.complete(code);
            await _safeClose(server);
            return;
          }

          req.response
            ..statusCode = HttpStatus.badRequest
            ..headers.contentType = ContentType.html
            ..write('<h3>Bad Request</h3><p>Missing "code" parameter.</p>');
          await req.response.close();
          return;
        }

        req.response
          ..statusCode = HttpStatus.notFound
          ..headers.contentType = ContentType.html
          ..write('<h3>Not Found</h3>');
        await req.response.close();
      } catch (_) {
        // ignore
      }
    });

    return completer.future.timeout(const Duration(minutes: 5), onTimeout: () async {
      await _safeClose(server);
      throw TimeoutException('Authentication timed out');
    });
  }

  Future<void> _safeClose(HttpServer server) async {
    try {
      await server.close(force: true);
    } catch (_) {
      // ignore
    }
  }

  Future<void> _openInBrowser(String url) async {
    try {
      if (Platform.isWindows) {
        String safeUrl = url.replaceAll('&', '^&');
        await Process.start('cmd', ['/c', 'start', safeUrl]);
      } else if (Platform.isMacOS) {
        await Process.run('open', [url]);
      } else if (Platform.isLinux) {
        await Process.run('xdg-open', [url]);
      }
    } catch (_) {
      
    }
  }

  // Token storage

  String _tokensFilePath() {
    final home = Platform.environment['USERPROFILE'] ?? Platform.environment['HOME'] ?? '.';
    final dir = Directory('$home/.mnm');
    if (!dir.existsSync()) dir.createSync(recursive: true);
    return '${dir.path}/auth.json';
  }

  Future<void> _saveTokens(Map<String, dynamic> tokens) async {
    final f = File(_tokensFilePath());
    final pretty = const JsonEncoder.withIndent('  ').convert(tokens);
    await f.writeAsString(pretty, encoding: utf8, flush: true);
  }

  Future<Map<String, dynamic>?> _loadTokens() async {
    final f = File(_tokensFilePath());
    if (!await f.exists()) return null;
    try {
      final text = await f.readAsString();
      return jsonDecode(text) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  DateTime? _expiresAt(Map<String, dynamic> tokens) {
    final createdAtStr = tokens['created_at'] as String?;
    final expiresIn = tokens['expires_in'];
    if (createdAtStr == null || expiresIn == null) return null;

    final createdAt = DateTime.tryParse(createdAtStr);
    final seconds = expiresIn is int ? expiresIn : int.tryParse(expiresIn.toString());
    if (createdAt == null || seconds == null) return null;
    return createdAt.add(Duration(seconds: seconds));
  }

  // Config loading (Google client credentials)

  Future<Map<String, dynamic>?> _readAuthConfig() async {
    // 1) Env override
    final override = Platform.environment['MNM_AUTH_CONFIG'];
    if (override != null && override.isNotEmpty) {
      final f = File(override);
      if (await f.exists()) {
        try {
          return jsonDecode(await f.readAsString()) as Map<String, dynamic>;
        } catch (_) {}
      }
    }

    // 2) Service-local default
    final local = File('lib/core/appconfig/auth.json');
    if (await local.exists()) {
      try {
        return jsonDecode(await local.readAsString()) as Map<String, dynamic>;
      } catch (_) {}
    }

    // 3) User home fallback
    final home = Platform.environment['USERPROFILE'] ?? Platform.environment['HOME'] ?? '.';
    final fallback = File('$home/.mnm/auth.json');
    if (await fallback.exists()) {
      try {
        return jsonDecode(await fallback.readAsString()) as Map<String, dynamic>;
      } catch (_) {}
    }
    return null;
  }

  String? _pickClientId(Map<String, dynamic>? cfg) {
    if (cfg == null) return null;
    if (cfg['client_id'] is String) return cfg['client_id'] as String;
    if (cfg['installed'] is Map && cfg['installed']['client_id'] is String) {
      return cfg['installed']['client_id'] as String;
    }
    return null;
  }

  String? _pickClientSecret(Map<String, dynamic>? cfg) {
    if (cfg == null) return null;
    if (cfg['client_secret'] is String) return cfg['client_secret'] as String;
    if (cfg['installed'] is Map && cfg['installed']['client_secret'] is String) {
      return cfg['installed']['client_secret'] as String;
    }
    return null;
  }
}