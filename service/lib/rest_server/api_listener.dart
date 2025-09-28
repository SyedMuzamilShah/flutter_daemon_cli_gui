import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mnm/state/todo_signals.dart';
import 'package:mnm/state/google_sso_signals.dart';

class ApiListener {
  final TodoSignals todo;
  final GoogleSsoSignals auth;
  final Router _router = Router();

  ApiListener(this.todo, this.auth) {
    _configureRoutes();
  }

  Handler get handler => const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(_corsMiddleware())
      .addMiddleware(_errorMiddleware())
      .addHandler(_router.call);

  void _configureRoutes() {
    // CORS preflight
    _router.options('/<ignored|.*>', (Request _) async => Response(204, headers: _corsHeaders));

    // Auth (desktop/CLI + general)
    _router.get('/auth/google/status', _authStatus);
    _router.post('/auth/google/login', _authLogin); // opens browser locally and completes
    _router.get('/auth/google/token', _authToken);
    _router.post('/auth/google/logout', _authLogout);

    // Tasks
    _router.get('/tasks', _getTasks);
    _router.post('/tasks', _postTask);
    _router.put('/tasks/<id|[0-9]+>', _putTask);
    _router.delete('/tasks/<id|[0-9]+>', _deleteTask);
  }

  // -------- Auth handlers --------

  Future<Response> _authStatus(Request request) async {
    final ok = await auth.isLoggedIn();
    return _json({'loggedIn': ok});
  }

  // For desktop/CLI: starts local loopback flow, opens browser, returns access_token
  Future<Response> _authLogin(Request request) async {
    final token = await auth.signInWithGoogle();
    return _json({'access_token': token}, status: 201);
  }

  Future<Response> _authToken(Request request) async {
    final token = await auth.getToken();
    return _json({'access_token': token});
  }

  Future<Response> _authLogout(Request request) async {
    await auth.signOut();
    return Response(204, headers: _corsJsonHeaders);
  }

  // -------- Task handlers --------

  Future<Response> _getTasks(Request request) async {
    await todo.loadTasks();
    final tasks = todo.tasks.value;
    final list = tasks
        .map((t) => {'id': t.id, 'title': t.title, 'completed': t.completed})
        .toList();
    return _json(list);
  }

  Future<Response> _postTask(Request request) async {
    final bodyStr = await request.readAsString();
    if (bodyStr.isEmpty) return _badRequest('Empty body');

    dynamic data;
    try {
      data = jsonDecode(bodyStr);
    } catch (_) {
      return _badRequest('Invalid JSON');
    }

    final title = (data is Map) ? (data['title']?.toString().trim() ?? '') : '';
    if (title.isEmpty) return _badRequest('Title is required');

    final newTask = await todo.addTask(title);
    return _json(
      {'id': newTask.id, 'title': newTask.title, 'completed': newTask.completed},
      status: 201,
      headers: {'Location': '/tasks/${newTask.id}'},
    );
  }

  Future<Response> _putTask(Request request, String id) async {
    final taskId = int.tryParse(id);
    if (taskId == null) return _badRequest('Invalid ID');

    final bodyStr = await request.readAsString();
    dynamic data;
    if (bodyStr.isNotEmpty) {
      try {
        data = jsonDecode(bodyStr);
      } catch (_) {
        return _badRequest('Invalid JSON');
      }
    }

    final completed = (data is Map) ? data['completed'] : null;
    final updated = await todo.toggleTask(taskId, completed);
    return _json({'id': updated.id, 'title': updated.title, 'completed': updated.completed});
  }

  Future<Response> _deleteTask(Request request, String id) async {
    final taskId = int.tryParse(id);
    if (taskId == null) return _badRequest('Invalid ID');

    final deleted = await todo.deleteTask(taskId);
    if (deleted == null) return _notFound('Task not found');
    return Response(204, headers: _corsJsonHeaders);
  }
}

// -------- Helpers --------

Response _json(Object body, {int status = 200, Map<String, String>? headers}) {
  return Response(
    status,
    body: jsonEncode(body),
    headers: {
      ..._corsJsonHeaders,
      if (headers != null) ...headers,
    },
  );
}

Response _badRequest(String message) => _json({'error': message}, status: 400);
Response _notFound(String message) => _json({'error': message}, status: 404);

// -------- Middleware --------

Middleware _errorMiddleware() {
  return (inner) => (request) async {
    try {
      return await inner(request);
    } catch (e) {
      return _json({'error': 'Internal Server Error', 'message': e.toString()}, status: 500);
    }
  };
}

const Map<String, String> _corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET,POST,PUT,DELETE,OPTIONS',
  'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept, Authorization',
};

Map<String, String> get _corsJsonHeaders => {
  ..._corsHeaders,
  'Content-Type': 'application/json; charset=utf-8',
};

Middleware _corsMiddleware() {
  return (inner) => (request) async {
    if (request.method == 'OPTIONS') {
      return Response(204, headers: _corsHeaders);
    }
    final resp = await inner(request);
    return resp.change(headers: _corsHeaders);
  };
}
