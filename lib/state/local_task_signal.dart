import 'package:mnm/data/repo/todo_repo.dart';
import 'package:mnm/model/local_todo_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LocalTaskSignals {
  LocalTaskClientRepo client;
  final tasks = Signal<List<TodoModel>>([]);

  LocalTaskSignals(this.client);

  Future<void> loadTasks() async {
    try {
      final response = await client.listTasks();
      print(response);
      tasks.value = response;
      return;
    } catch (e) {
      print("Error loading tasks: $e");
    }
  }

  Future<void> addTask(String title) async {
    print("Testing in side signals");
    final task = await client.addTask(title);
    print("Added task: $task");
    tasks.value = [...tasks.value, task];
  }

  Future<void> toggleTask(int id, bool completed) async {
    final response =
    await client.toggleTask(id, completed);
    print(response);
    final updated = tasks.value.map((t) => t.id == id.toString() ? TodoModel(t.id, t.title, !t.completed) : t).toList();
    tasks.value = updated;
  }

  Future<void> deleteTask(int id) async {
    // await client.client.deleteTask(DeleteTaskRequest(id: id));
    await client.deleteTask(id);
    // final updated = tasks.value.where((t) => t.id != id).toList();
    tasks.value = tasks.value.where((t) => t.id != id.toString()).toList();
  }
}
