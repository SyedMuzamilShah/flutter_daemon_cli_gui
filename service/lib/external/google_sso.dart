import 'dart:convert';
import 'dart:io';

import 'package:mnm/external/file_interaction.dart';
import 'package:mnm/rest/http_listener.dart';

abstract class GoogleSSO {
  Future<String> signInWithGoogle(); // returns access_token
  Future<void> signOut();
  Future<bool> isLoggedIn();
  Future<String> getToken();
}

class GoogleSSOImpl implements GoogleSSO {
  final FileInteraction fileInteraction = FileInteraction();
  late final Map<String, dynamic>? file;

  GoogleSSOImpl() {
    file = fileInteraction
        .readFile(); // expects client_id, redirect_uri, (optional) client_secret
  }

  Uri _authUrl() {
    if (file == null) throw Exception("Config file not found");
    final params = {
      'client_id': file!['client_id'],
      'redirect_uri': file!['redirect_uri'],
      'response_type': 'code',
      'scope': 'openid email profile',
      'access_type': 'offline',
      'prompt': 'consent',
    };
    return Uri.https('accounts.google.com', '/o/oauth2/v2/auth', params);
  }

  Future<void> _openInBrowser(String url) async {
    if (Platform.isWindows) {
      await Process.start('cmd', ['/c', 'start', url]);
    } else if (Platform.isMacOS) {
      await Process.run('open', [url]);
    } else if (Platform.isLinux) {
      await Process.run('xdg-open', [url]);
    }
  }

  Future<Map<String, dynamic>> _exchangeCodeForToken(String code) async {
    final uri = Uri.parse('https://oauth2.googleapis.com/token');
    final map = {
      'grant_type': 'authorization_code',
      'code': code,
      'client_id': file!['client_id'],
      'redirect_uri': file!['redirect_uri'],
    };
    final secret = file!['client_secret'];
    if (secret != null && secret.toString().isNotEmpty) {
      map['client_secret'] = secret;
    }

    final client = HttpClient();
    try {
      final req = await client.postUrl(uri);
      req.headers.contentType =
          ContentType('application', 'x-www-form-urlencoded');
      req.write(map.entries
          .map((e) =>
              '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
          .join('&'));
      final res = await req.close();
      final body = await res.transform(utf8.decoder).join();
      if (res.statusCode != 200) {
        throw Exception('Token exchange failed (${res.statusCode}): $body');
      }
      final json = jsonDecode(body) as Map<String, dynamic>;
      // add timestamp for simple expiry checks if needed
      json['created_at'] = DateTime.now().toIso8601String();
      return json;
    } finally {
      client.close(force: true);
    }
  }

  File _authFile() {
    final home = Platform.environment['USERPROFILE'] ??
        Platform.environment['HOME'] ??
        '.';
    final dir = Directory('$home/.mnm');
    if (!dir.existsSync()) dir.createSync(recursive: true);
    return File('${dir.path}/auth.json');
  }

  Future<void> _saveTokens(Map<String, dynamic> tokens) async {
    await _authFile().writeAsString(jsonEncode(tokens));
  }

  Future<Map<String, dynamic>?> _loadTokens() async {
    final f = _authFile();
    if (!await f.exists()) return null;
    final txt = await f.readAsString();
    return jsonDecode(txt) as Map<String, dynamic>;
  }

  @override
  Future<String> signInWithGoogle() async {
    // 1) open browser
    final authUrl = _authUrl().toString();
    print(authUrl);
    await _openInBrowser(authUrl);

    // 2) wait for code on http://localhost:8080/callback?code=...
    final listener = HttpListener(port: 8080);
    await listener.start();
    final code = await listener.waitForCode();

    // 3) exchange code -> tokens
    final tokens = await _exchangeCodeForToken(code);

    // 4) save & return access_token
    await _saveTokens(tokens);
    final token = tokens['access_token'] as String?;
    if (token == null || token.isEmpty) {
      throw Exception('No access_token in token response');
    }
    return token;
  }

  @override
  Future<String> getToken() async {
    final tokens = await _loadTokens();
    if (tokens == null) {
      throw Exception('Not authenticated. Please sign in.');
    }
    final token = tokens['access_token'] as String?;
    if (token == null || token.isEmpty) {
      throw Exception('Stored token invalid. Please sign in.');
    }
    return token;
  }

  @override
  Future<void> signOut() async {
    final f = _authFile();
    if (await f.exists()) {
      await f.delete();
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final tokens = await _loadTokens();
    if (tokens == null) return false;
    final token = tokens['access_token'] as String?;

    if (token == null || token.isEmpty) return false;
    final expiresAt = _expiresAt(tokens);
    if (expiresAt != null && DateTime.now().isAfter(expiresAt)) {
      return false;
    }
    return true;
  }

  DateTime? _expiresAt(Map<String, dynamic> tokens) {
    final createdAtStr = tokens['created_at'] as String?;
    final expiresIn = tokens['expires_in'];
    if (createdAtStr == null || expiresIn == null) return null;

    final createdAt = DateTime.tryParse(createdAtStr);
    final seconds =
        expiresIn is int ? expiresIn : int.tryParse(expiresIn.toString());
    if (createdAt == null || seconds == null) return null;

    return createdAt.add(Duration(seconds: seconds));
  }
}
