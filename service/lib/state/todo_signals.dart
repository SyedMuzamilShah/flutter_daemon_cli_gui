import 'package:signals/signals.dart';
import '../utils/db/drift_database.dart';

class TodoSignals {
  final AppDatabase db;
  final Signal<List<Task>> tasks = signal([]);

    TodoSignals(this.db);

  Future<void> loadTasks() async {
    final list = await db.getAllTasks();
    tasks.value = list;
  }

  Future<Task> addTask(String title) async {
    final id = await db.addTask(title);
    await loadTasks();
    return tasks.value.firstWhere((t) => t.id == id);
  }

  Future<Task> toggleTask(int id, bool completed) async {
    await db.updateTask(id, completed);
    await loadTasks();
    return tasks.value.firstWhere((t) => t.id == id);
  }

  Future<Task?> deleteTask(int id) async {
    final deletedTask = tasks.value.firstWhere((t) => t.id == id);
    await db.deleteTask(id);
    await loadTasks();
    return deletedTask;
  }
}
