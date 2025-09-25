import 'dart:convert';

import 'package:mnm/data/repo/remote_repo.dart';
import 'package:mnm/model/remote_todo_model.dart';
import 'package:http/http.dart' as http;

class RemoteRepoImpl extends RemoteClientRepo {
  @override
  Future<RemoteTodoModel> fetchRemoteTaskById(String id) async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
    );
    if (response.statusCode == 200) {
      return RemoteTodoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load task');
    }
  }

  @override
  Future<List<RemoteTodoModel>> fetchRemoteTasks() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> tasksJson = json.decode(response.body);
      return tasksJson.map((json) => RemoteTodoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
