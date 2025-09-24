import 'package:flutter/material.dart';
import 'package:mnm/state/remote_task_signal.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../widgets/task_tile.dart';

class RemoteTasksScreen extends StatelessWidget {
  final RemoteTaskSignals signals;

  const RemoteTasksScreen({super.key, required this.signals});

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
        final tasks = signals.tasks.value; // get the current value

        if (tasks.isEmpty) {
          return const Center(child: Text('📭 No tasks found'));
        }

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final t = tasks[index];

            return TaskTile(
              title: t.title,
              completed: t.completed,
              onToggle: null, // read-only
              onDelete: null, // read-only
            );
          },
        );
      },
    dependencies: [signals.tasks], // ✅ list of signals to watch
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:mnm/state/remote_task_signal.dart';
// import 'package:signals_flutter/signals_flutter.dart';

// import '../widgets/task_tile.dart';

// class RemoteTasksScreen extends StatelessWidget {
//   final RemoteTaskSignals signals;

//   const RemoteTasksScreen({super.key, required this.signals});

//   @override
//   Widget build(BuildContext context) {
//     return Watch.builder(builder: builder)<List>(
//       signal: signals.tasks,
//       builder: (context, tasks) {
//         if (tasks.isEmpty) {
//           return const Center(child: Text('📭 No tasks found'));
//         }

//         return ListView.builder(
//           itemCount: tasks.length,
//           itemBuilder: (context, index) {
//             final task = tasks[index];

//             return TaskTile(
//               title: task.title,
//               completed: task.completed,
//               onToggle: null,
//               onDelete: null,
//             );
//           },
//         );
//       },
//     );
//   }
// }