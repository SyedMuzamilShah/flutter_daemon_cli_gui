import 'package:grpc/service_api.dart';
import 'package:mnm/data/repo/remote_repo.dart';
import 'package:mnm/core/generated/remote_todo.pbgrpc.dart' as pb;
import 'package:mnm/model/remote_todo_model.dart';

class RemoteTodoGrpcImpl extends RemoteClientRepo {
  final ClientChannel channel;
  final pb.RemoteTasksServiceClient _stub;

  RemoteTodoGrpcImpl(this.channel)
    : _stub = pb.RemoteTasksServiceClient(channel);

  @override
  Future<List<RemoteTodoModel>> fetchRemoteTasks() async {
    print("Testing gRPC fetchRemoteTasks");
    try {
      final response = await _stub.fetchRemoteTasks(pb.RemoteEmpty());
      return response.tasks
          .map(
            (e) => RemoteTodoModel(
              e.userId.toString(),
              e.id.toString(),
              e.title,
              e.completed,
            ),
          )
          .toList();
    } catch (e, _) {
      print('Error fetching remote tasks: $e\n');
      throw Exception('Failed to load tasks');
    }
  }

  @override
  Future<RemoteTodoModel> fetchRemoteTaskById(String id) async {
    try {
      final task = await _stub.fetchRemoteTaskById(
        pb.FetchTaskByIdRequest(id: int.parse(id)),
      );
      return RemoteTodoModel(
        task.userId.toString(),
        task.id.toString(),
        task.title,
        task.completed,
      );
    } catch (e, stack) {
      print('Error fetching remote task by id: $e\n$stack');
      rethrow;
    }
  }
}
