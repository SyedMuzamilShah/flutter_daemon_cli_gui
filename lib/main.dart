import 'package:flutter/material.dart';
import 'package:mnm/state/auth_signal.dart';
import 'package:mnm/state/local_task_signal.dart';
import 'package:mnm/state/remote_task_signal.dart';
import 'package:mnm/pages/home_screen.dart';
import 'package:mnm/usecase/in_process_config.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localClient = createCoreClientInstance();
    final remoteClient = createRemoteClientInstance();
    final authClient = createAuthClientInstance();

    // State management instances
    final localSignals = LocalTaskSignals(localClient);
    final remoteSignals = RemoteTaskSignals(remoteClient);
    final authSignal = AuthSignal(authClient);

    // App Material Wrapper
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(
        localSignals: localSignals,
        remoteSignals: remoteSignals,
        authSignal: authSignal,
      ),
    );
  }
}
