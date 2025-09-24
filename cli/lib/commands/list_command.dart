import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mnm/cli_app.dart';
import 'package:mnm/generated/todo.pbgrpc.dart';

class ListCommand extends Command {
  @override
  String get name => 'list';
  @override
  String get description => 'List all tasks';

  @override
  Future<void> run() async {

    // inside daemon lib/cli_app.dart client connector to grpc server from where we can call the rpc methods
    final cli = TodoCli();
    try {
      final response = await cli.client.listTasks(Empty());
      if (response.tasks.isEmpty) {
        print('No tasks found');
      } else {
        for (var t in response.tasks) {
          print('[${t.id}] ${t.title} - ${t.completed ? "✅" : "❌"}');
        }
      }
    } finally {
      ProcessSignal.sigint.watch().listen((a) async {
        print("Testing ${a.name}");
      });
      await cli.shutdown();
    }
  }
}
