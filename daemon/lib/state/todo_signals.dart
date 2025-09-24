import 'package:signals/signals.dart';
import '../db/drift_database.dart';

class TodoSignals {
  final AppDatabase db;
  final Signal<List<Task>> tasks = signal([]);

    TodoSignals(this.db);

  Future<void> loadTasks() async {
    final list = await db.getAllTasks();
    tasks.value = list;
  }

  Future<void> addTask(String title) async {
    await db.addTask(title);
    await loadTasks();
  }

  Future<void> toggleTask(int id, bool completed) async {
    await db.updateTask(id, completed);
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await db.deleteTask(id);
    await loadTasks();
  }
}
