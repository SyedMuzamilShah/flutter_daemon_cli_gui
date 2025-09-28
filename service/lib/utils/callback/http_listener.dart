// import 'dart:async';
// import 'dart:io';

// class HttpListener {
//   final int port;
//   HttpServer? _server;
//   final _codeCompleter = Completer<String>();

//   HttpListener({this.port = 8080});

//   Future<void> start() async {
//     _server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
//     print('HTTP Server listening on http://localhost:$port');

//     _server!.listen((HttpRequest request) async {
//       if (request.method == 'GET' && request.uri.path == '/callback') {
//         final code = request.uri.queryParameters['code'];
//         final error = request.uri.queryParameters['error'];

//         if (error != null) {
//           request.response
//             ..statusCode = HttpStatus.ok
//             ..headers.contentType = ContentType.html
//             ..write('<h3>Authentication failed</h3><p>$error</p>');
//           await request.response.close();
//           if (!_codeCompleter.isCompleted) {
//             _codeCompleter.completeError(StateError('Auth error: $error'));
//           }
//           await stop();
//           return;
//         }

//         if (code != null) {
//           request.response
//             ..statusCode = HttpStatus.ok
//             ..headers.contentType = ContentType.html
//             ..write('<h3>Authentication successful</h3><p>You can close this window.</p>');
//           await request.response.close();
//           if (!_codeCompleter.isCompleted) {
//             _codeCompleter.complete(code);
//           }
//           await stop();
//           return;
//         }

//         request.response
//           ..statusCode = HttpStatus.badRequest
//           ..headers.contentType = ContentType.html
//           ..write('<h3>Bad Request</h3><p>Missing code parameter.</p>');
//         await request.response.close();
//       } else {
//         request.response
//           ..statusCode = HttpStatus.notFound
//           ..headers.contentType = ContentType.html
//           ..write('<h3>Not Found</h3>');
//         await request.response.close();
//       }
//     });
//   }

//   Future<String> waitForCode({Duration timeout = const Duration(minutes: 5)}) {
//     return _codeCompleter.future.timeout(timeout);
//   }

//   Future<void> stop() async {
//     await _server?.close(force: true);
//     _server = null;
//     print('HTTP Server stopped.');
//   }
// }