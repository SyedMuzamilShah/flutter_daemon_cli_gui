import 'package:grpc/grpc.dart';
import 'package:mnm/rest_server/api_listener.dart';
import 'package:mnm/state/google_sso_signals.dart';
import 'package:mnm/utils/db/drift_database.dart';
import 'package:mnm/services/http/jsonplaceholder_api.dart';
import 'package:mnm/services/grpc/remote_todo_service.dart';
import 'package:mnm/services/grpc/sso_login_service.dart';
import 'package:mnm/services/grpc/todo_service.dart';
import 'package:mnm/state/todo_signals.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
Future<void> main() async {
  // Local database
  final db = AppDatabase();

  // State management
  final signals = TodoSignals(db);
  final googleSSO = GoogleSsoSignals();
  await signals.loadTasks();

  // Start gRPC server
  final server = Server.create(services: [
    TodoServiceImpl(signals),
    RemoteTodoServiceImpl(JsonPlaceHolderApiImpl(),),
    GoogleServices()
  ]);
  await server.serve(port: 50051);
  print('Daemon Running on PORT ${server.port}');

  // Start REST API server
  final ApiListener api = ApiListener(signals, googleSSO);
  await shelf_io.serve(api.handler, 'localhost', 8080);
  print('REST API running on http://localhost:8080');
}
