import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';

part 'drift_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = Directory.current.path; // or custom path
    final file = File(p.join(dbFolder, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // CRUD
  Future<int> addTask(String title) =>
      into(tasks).insert(TasksCompanion.insert(title: title));

  Future<List<Task>> getAllTasks() => select(tasks).get();

  Future updateTask(int id, bool completed) {
    return (update(tasks)..where((tbl) => tbl.id.equals(id)))
        .write(TasksCompanion(completed: Value(completed)));
  }

  Future deleteTask(int id) =>
      (delete(tasks)..where((tbl) => tbl.id.equals(id))).go();
}
