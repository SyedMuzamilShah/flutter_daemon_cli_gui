import 'package:flutter/material.dart';
import 'package:mnm/state/local_task_signal.dart';
import 'package:mnm/state/remote_task_signal.dart';
import 'package:mnm/pages/home_screen.dart';
import 'package:mnm/usecase/todo_factory.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localClient = createCoreClientInstance();
    final remoteClient = createRemoteClientInstance();

    // State management instances
    final localSignals = LocalTaskSignals(localClient);
    final remoteSignals = RemoteTaskSignals(remoteClient);


    // App Material Wrapper
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(
        localSignals: localSignals,
        remoteSignals: remoteSignals,
      ),
    );
  }
}