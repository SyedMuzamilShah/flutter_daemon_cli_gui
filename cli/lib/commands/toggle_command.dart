import 'package:args/command_runner.dart';
import 'package:mnm/cli_app.dart';
import 'package:mnm/generated/todo.pbgrpc.dart';

class ToggleCommand extends Command {
  @override
  String get name => 'toggle';
  @override
  String get description => 'Toggle the completed status of a task';

  ToggleCommand() {
    argParser
      ..addOption('id', abbr: 'i', help: 'ID of the task to toggle')
      ..addOption('completed', abbr: 'c', help: 'New completed status (true/false)');
  }

  @override
  Future<void> run() async {
    final idStr = argResults?['id'] as String?;
    final completedStr = argResults?['completed'] as String?;

    if (idStr == null || completedStr == null) {
      print('Usage: toggle --id <id> --completed <true|false>');
      return;
    }

    final id = int.tryParse(idStr);
    final completed = completedStr.toLowerCase() == 'true';

    if (id == null) {
      print('Invalid task ID');
      return;
    }

    final cli = TodoCli();
    try {
      final response =
          await cli.client.toggleTask(ToggleTaskRequest(id: id, completed: completed));
      print('Updated: [${response.id}] ${response.title} = ${response.completed}');
    } finally {
      await cli.shutdown();
    }
  }
}
