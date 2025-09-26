import 'package:flutter/material.dart';
import 'package:mnm/data/repo/auth_repo.dart';
import 'package:mnm/pages/auth_screen.dart';
import 'package:mnm/pages/widgets/local_tasks_screen.dart';
import 'package:mnm/pages/widgets/remote_tasks_screen.dart';
import 'package:mnm/state/auth_signal.dart';
import 'package:mnm/state/local_task_signal.dart';
import 'package:mnm/state/remote_task_signal.dart';

class HomeScreen extends StatefulWidget {
  final LocalTaskSignals localSignals;
  final RemoteTaskSignals remoteSignals;
  final AuthSignal authSignal;

  const HomeScreen({
    super.key,
    required this.localSignals,
    required this.remoteSignals,
    required this.authSignal,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    widget.localSignals.loadTasks();
    widget.remoteSignals.loadTasks();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      LocalTasksScreen(signals: widget.localSignals),
      RemoteTasksScreen(signals: widget.remoteSignals),
      AuthScreen(signals: widget.authSignal,),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: pages[selectedTab],

      floatingActionButton: selectedTab == 0
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _showAddTaskDialog(context),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (i) => setState(() => selectedTab = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Local'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Remote'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Auth'),
        ],
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Task'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Task title'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = controller.text.trim();
              if (title.isNotEmpty) {
                widget.localSignals.addTask(title);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
