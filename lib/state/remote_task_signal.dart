import 'package:mnm/generated/remote_todo.pbgrpc.dart';
// import 'package:signals/signals.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../services/remote_task_client.dart';

class RemoteTaskSignals {
  final RemoteTaskClient client;

  
  final tasks = Signal<List<RemoteTask>>([]);

  RemoteTaskSignals(this.client);

  Future<void> loadTasks() async {
    final response = await client.client.fetchRemoteTasks(RemoteEmpty());
    tasks.value = response.tasks;
  }

  Future<RemoteTask?> fetchTaskById(int id) async {
    try {
      final task = await client.client.fetchRemoteTaskById(FetchTaskByIdRequest(id: id));
      return task;
    } catch (e) {
      return null;
    }
  }
}
