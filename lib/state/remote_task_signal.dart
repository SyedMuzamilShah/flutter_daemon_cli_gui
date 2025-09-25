import 'package:mnm/data/repo/remote_repo.dart';
import 'package:mnm/model/remote_todo_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

class RemoteTaskSignals {
  final RemoteClientRepo client;

  final tasks = Signal<List<RemoteTodoModel>>([]);

  RemoteTaskSignals(this.client);

  Future<void> loadTasks() async {
    print("Testing in RemoteTaskSignals loadTasks");
    // final response = await client.client.fetchRemoteTasks(RemoteEmpty());
    final response = await client.fetchRemoteTasks();
    tasks.value = response;
  }

  Future<void> fetchTaskById(int id) async {
    try {
      final task = await client.fetchRemoteTaskById(id.toString());
      tasks.value = [task];
    } catch (e) {
      print("Error fetching task by id: $e");
    }
  }
}
