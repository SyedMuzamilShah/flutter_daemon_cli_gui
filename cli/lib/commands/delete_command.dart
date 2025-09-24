import 'package:args/command_runner.dart';
import 'package:mnm/cli_app.dart';
import 'package:mnm/generated/todo.pbgrpc.dart';

class DeleteCommand extends Command {
  @override
  String get name => 'delete';
  @override
  String get description => 'Delete a task by ID';

  DeleteCommand() {
    argParser.addOption('id', abbr: 'i', help: 'ID of the task to delete');
  }

  @override
  Future<void> run() async {
    final idStr = argResults?['id'] as String?;

    if (idStr == null) {
      print('Usage: delete --id <id>');
      return;
    }

    final id = int.tryParse(idStr);

    if (id == null) {
      print('Invalid task ID');
      return;
    }

    final cli = TodoCli();
    try {
      await cli.client.deleteTask(DeleteTaskRequest(id: id));
      print('Deleted task $id');
    } finally {
      await cli.shutdown();
    }
  }
}
