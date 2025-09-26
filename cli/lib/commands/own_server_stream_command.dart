import 'package:args/command_runner.dart';
import 'package:mnm/core/generated/remote_todo.pb.dart';
import 'package:mnm/remote_cli_app.dart';

class OwnServerStreamCommand extends Command {
  @override
  String get name => 'own';
  @override
  String get description => 'Fetch tasks from the own server as stream';

  @override
  Future<void> run() async {
    print('Fetching tasks from own server as stream...');
    final cli = RemoteTodoCli(port: 50052);
    try {
      await for (final task in cli.client.fetchFromOwnServer(RemoteEmpty())) {
        print('[${task.id}] ${task.title} - ${task.completed ? "✅" : "❌"}');
      }
    } catch (e) {
      print('Error fetching tasks: $e');
    } finally {
      await cli.shutdown();
    }
  }
}