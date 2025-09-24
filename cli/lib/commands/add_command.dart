import 'package:args/command_runner.dart';
import 'package:mnm/cli_app.dart';
import 'package:mnm/generated/todo.pbgrpc.dart';

class AddCommand extends Command {
  @override
  String get name => 'add';
  @override
  String get description => 'Add a new task';

  AddCommand() {
    argParser.addOption('title', abbr: 't', help: 'Title of the task');
  }

  @override
  Future<void> run() async {
    final title = argResults?['title'] as String?;
    if (title == null || title.isEmpty) {
      print('Please provide a task title using --title or -t');
      return;
    }

    final cli = TodoCli();
    try {
      // final response = await cli.client.addTask(AddTaskRequest(title: title));

      // Above line can also be written as below using cascade operator
      final response = await cli.client.addTask(AddTaskRequest()..title = title);
      print('Added: [${response.id}] ${response.title}');
    } finally {
      await cli.shutdown();
    }
  }
}
