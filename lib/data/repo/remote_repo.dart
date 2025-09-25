import 'package:mnm/model/remote_todo_model.dart';

abstract class RemoteClientRepo {
  Future<List<RemoteTodoModel>> fetchRemoteTasks();
  Future<RemoteTodoModel> fetchRemoteTaskById(String id);
}