import 'package:flutter/material.dart';
import 'package:mnm/state/local_task_signal.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../widgets/task_tile.dart';

class LocalTasksScreen extends StatelessWidget {
  final LocalTaskSignals signals;

  const LocalTasksScreen({super.key, required this.signals});

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final tasks = signals.tasks.value;

      if (tasks.isEmpty) {
        return const Center(child: Text('📭 No tasks found'));
      }

      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return TaskTile(
            title: task.title,
            completed: task.completed,
            onToggle: () => signals.toggleTask(task.id, !task.completed),
            onDelete: () => signals.deleteTask(task.id),
          );
        },
      );
    });
  }
}
