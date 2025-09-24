import 'package:args/command_runner.dart';
import 'package:mnm/generated/remote_todo.pbgrpc.dart';
import 'package:mnm/remote_cli_app.dart';

class RemoteFetchByIdCommand extends Command {
  @override
  String get name => 'remote-fetch';
  @override
  String get description => 'Fetch a single remote task by ID';

  RemoteFetchByIdCommand() {
    argParser.addOption('id', abbr: 'i', help: 'Task ID');
  }

  @override
  Future<void> run() async {
    final idStr = argResults?['id'] as String?;
    if (idStr == null) {
      print('Please provide an id: --id <task_id>');
      return;
    }

    final id = int.tryParse(idStr);
    if (id == null) {
      print('Invalid id');
      return;
    }

    final cli = RemoteTodoCli();
    try {
      final task = await cli.client.fetchRemoteTaskById(FetchTaskByIdRequest(id: id));
      print('[${task.id}] ${task.title} - ${task.completed ? "✅" : "❌"}');
    } catch (e) {
      print('Error fetching task: $e');
    } finally {
      await cli.shutdown();
    }
  }
}
