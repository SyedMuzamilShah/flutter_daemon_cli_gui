import 'package:mnm/generated/todo.pb.dart';
import 'package:mnm/services/local_task_client.dart';
// import 'package:signals/signals.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LocalTaskSignals {
  final LocalTaskClient client;
  // Reactive list of tasks
  final tasks = Signal<List<TaskResponse>>([]);

  LocalTaskSignals(this.client);

  Future<void> loadTasks() async {
    final response = await client.client.listTasks(Empty());
    tasks.value = response.tasks;
  }

  Future<void> addTask(String title) async {
    final response = await client.client.addTask(AddTaskRequest(title: title));
    tasks.value = [...tasks.value, response]; // reactive update
  }

  Future<void> toggleTask(int id, bool completed) async {
    final response =
        await client.client.toggleTask(ToggleTaskRequest(id: id, completed: completed));
    final updated = tasks.value.map((t) => t.id == id ? response : t).toList();
    tasks.value = updated;
  }

  Future<void> deleteTask(int id) async {
    await client.client.deleteTask(DeleteTaskRequest(id: id));
    tasks.value = tasks.value.where((t) => t.id != id).toList();
  }
}
