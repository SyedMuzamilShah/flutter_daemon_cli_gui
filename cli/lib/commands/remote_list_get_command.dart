import 'package:args/command_runner.dart';
import 'package:mnm/core/generated/remote_todo.pbgrpc.dart';
import 'package:mnm/remote_cli_app.dart';

class RemoteListGetCommand extends Command {
  @override
  String get name => 'remote-list';
  @override
  String get description => 'List all remote tasks from JSONPlaceholder via daemon';

  @override
  Future<void> run() async {
    final cli = RemoteTodoCli();
    print("Testing remote-list command...");
    try {
      final response = await cli.client.fetchRemoteTasks(RemoteEmpty());
      if (response.tasks.isEmpty) {
        print('No remote tasks found');
      } else {
        for (var t in response.tasks) {
          print('[${t.id}] ${t.title} - ${t.completed ? "✅" : "❌"}');
        }
      }
    } finally {
      await cli.shutdown();
    }
  }
}