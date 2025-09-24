import 'package:grpc/grpc.dart';
import 'package:mnm/db/drift_database.dart';
import 'package:mnm/external/jsonplaceholder_api.dart';
import 'package:mnm/services/remote_todo_service.dart';
import 'package:mnm/services/todo_service.dart';
import 'package:mnm/state/todo_signals.dart';
Future<void> main() async {
  final db = AppDatabase();
  final signals = TodoSignals(db);
  await signals.loadTasks();

  final server = Server([TodoServiceImpl(signals), RemoteTodoServiceImpl(JsonPlaceHolderApiImpl())]);
  await server.serve(port: 50051);
  print('✅ Daemon started on port ${server.port}');
}
