import 'package:args/command_runner.dart';
import 'package:mnm/commands/list_command.dart';
import 'package:mnm/commands/add_command.dart';
import 'package:mnm/commands/login_command.dart';
import 'package:mnm/commands/logout_command.dart';
import 'package:mnm/commands/own_server_stream_command.dart';
import 'package:mnm/commands/remote_fetch_by_id_command.dart';
import 'package:mnm/commands/remote_list_get_command.dart';
import 'package:mnm/commands/toggle_command.dart';
import 'package:mnm/commands/delete_command.dart';

void main(List<String> args) async {
  final runner = CommandRunner('mnm', 'Todo CLI using gRPC')
    ..addCommand(ListCommand())
    ..addCommand(AddCommand())
    ..addCommand(ToggleCommand())
    ..addCommand(DeleteCommand())
    ..addCommand(RemoteListGetCommand())
    ..addCommand(RemoteFetchByIdCommand())
    ..addCommand(OwnServerStreamCommand())
    ..addCommand(LoginCommand())
    ..addCommand(LogoutCommand());

  try {
    await runner.run(args);
  } catch (e) {
    print('Error: $e');
  }
}
