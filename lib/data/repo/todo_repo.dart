import 'package:mnm/model/local_todo_model.dart';

abstract class LocalTaskClientRepo {
  Future<List<TodoModel>> listTasks ();
  Future<TodoModel> addTask(String title);
  Future<TodoModel> toggleTask(int id, bool completed);
  Future<void> deleteTask(int id);
  Future<void> dispose();
}