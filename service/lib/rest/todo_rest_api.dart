import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'dart:convert';
import '../state/todo_signals.dart';

class TodoRestApi {
  final TodoSignals signals;
  TodoRestApi(this.signals);

  Handler get handler {
    final pipeline = Pipeline().addMiddleware(logRequests());
    return pipeline.addHandler(_router);
  }

  Future<Response> _router(Request request) async {
    print("Method: ${request.method}, Path: ${request.url.path}");
    // final bod = await request.readAsString();
    // print("BOdy testing : $bod");
    // Handle CORS preflight
    if (request.method == 'OPTIONS') {
      return Response.ok('', headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Origin, Content-Type',
      });
    }
    if (request.url.path == 'tasks' && request.method == 'GET') {
      await signals.loadTasks();
      final tasks = signals.tasks.value;
      return Response.ok(
          jsonEncode(tasks
              .map((t) => {
                    'id': t.id,
                    'title': t.title,
                    'completed': t.completed,
                  })
              .toList()),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers': 'Origin, Content-Type',
          });
    }
    if (request.url.path == 'tasks' && request.method == 'POST') {
      final body = await request.readAsString();
      final data = jsonDecode(body);
      final newTask = await signals.addTask(data['title']);
      return Response.ok(
          jsonEncode({
            'id': newTask.id,
            'title': newTask.title,
            'completed': newTask.completed,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers': 'Origin, Content-Type',
          });
    }
    // DELETE /tasks/<id>
    final segments = request.url.pathSegments;
    if (segments.length == 2 &&
        segments[0] == 'tasks' &&
        request.method == 'DELETE') {
      final id = int.tryParse(segments[1]);
      if (id == null) {
        return Response(400, body: 'Invalid ID', headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type',
        });
      }
      final deletedTask = await signals.deleteTask(id);
      if (deletedTask == null) {
        return Response.notFound('Task not found', headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type',
        });
      }
      return Response.ok(
          jsonEncode({
            'id': deletedTask.id,
            'title': deletedTask.title,
            'completed': deletedTask.completed,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers': 'Origin, Content-Type',
          });
    }

    // PUT /tasks/<id> (toggle completed)
    if (segments.length == 2 &&
        segments[0] == 'tasks' &&
        request.method == 'PUT') {
      final id = int.tryParse(segments[1]);
      if (id == null) {
        return Response(400, body: 'Invalid ID', headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type',
        });
      }
      final body = await request.readAsString();
      final data = jsonDecode(body);
      final completed = data['completed'] as bool?;
      if (completed == null) {
        return Response(400, body: 'Missing completed', headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type',
        });
      }
      final updatedTask = await signals.toggleTask(id, completed);
      return Response.ok(
          jsonEncode({
            'id': updatedTask.id,
            'title': updatedTask.title,
            'completed': updatedTask.completed,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers': 'Origin, Content-Type',
          });
    }

    return Response.notFound('Not Found', headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Origin, Content-Type',
    });
  }
}

Future<void> startRestServer(TodoSignals signals,
    {String host = 'localhost', int port = 8080}) async {
  final api = TodoRestApi(signals);
  await shelf_io.serve(api.handler, host, port);
  print('✅ REST API started on http://$host:$port');
}
