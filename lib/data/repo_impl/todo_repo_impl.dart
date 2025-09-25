import 'dart:convert';

import 'package:mnm/data/repo/todo_repo.dart';
import 'package:mnm/model/local_todo_model.dart';
import 'package:http/http.dart' as http;

class LocalTodoRepoImpl implements LocalTaskClientRepo {
  final String baseUrl;
  LocalTodoRepoImpl({this.baseUrl = 'http://localhost:8080'});

  @override
  Future<TodoModel> addTask(String title) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/tasks'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'title': title}),
      );
      if (response.statusCode == 200) {
        final task = jsonDecode(response.body);
        TodoModel newTask = TodoModel(
          task['id'].toString(),
          task['title'],
          task['completed'],
        );
        return newTask;
      } else {
        throw Exception('Failed to add task');
      }
    } catch (e, stack) {
      print('Error adding task: $e\n$stack');
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/tasks/$id'));
      if (response.statusCode != 200) {
        throw Exception('Failed to delete task');
      }
    } catch (e, stack) {
      print('Error deleting task: $e\n$stack');
      rethrow;
    }
  }

  @override
  Future<List<TodoModel>> listTasks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tasks'));
      if (response.statusCode == 200) {
        final List<dynamic> tasksJson = jsonDecode(response.body);
        return tasksJson.map((task) {
          return TodoModel(
            task['id'].toString(),
            task['title'],
            task['completed'],
          );
        }).toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e, stack) {
      print('Error loading tasks: $e\n$stack');
      rethrow;
    }
  }

  @override
  Future<TodoModel> toggleTask(int id, bool completed) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/tasks/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'completed': completed}),
      );

      if (response.statusCode == 200) {
        final task = jsonDecode(response.body);
        return TodoModel(
          task['id'].toString(),
          task['title'],
          task['completed'],
        );
      } else {
        throw Exception('Failed to toggle task');
      }
    } catch (e, _) {
      print('Error toggling task: $e\n');
      // rethrow;
      throw Exception('Failed to toggle task');
    }
  }
  
  @override
  Future<void> dispose() async {}
}
