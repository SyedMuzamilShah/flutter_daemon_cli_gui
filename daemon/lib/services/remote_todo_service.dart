import 'package:grpc/grpc.dart';
import 'package:mnm/external/jsonplaceholder_api.dart';
import 'package:mnm/external/own_server.dart';
import 'package:mnm/generated/remote_todo.pbgrpc.dart';

class RemoteTodoServiceImpl extends RemoteTasksServiceBase {
  final ExternalApi api;
  RemoteTodoServiceImpl(this.api);

  @override
  Future<RemoteTask> fetchRemoteTaskById(
      ServiceCall call, FetchTaskByIdRequest request) async {
    try {
      final response = await api.fetchTodoById(request.id);
      return RemoteTask(
        userId: response['userId'],
        id: response['id'],
        title: response['title'],
        completed: response['completed'],
      );
    } catch (e) {
      throw GrpcError.notFound('Task with ID ${request.id} not found');
    }
  }

  @override
  Future<RemoteTasksResponse> fetchRemoteTasks(
      ServiceCall call, RemoteEmpty request) async {
    try {
      final response = await api.fetchTodos();
      final tasks = response.map((data) {
        return RemoteTask(
          userId: data['userId'],
          id: data['id'],
          title: data['title'],
          completed: data['completed'],
        );
      }).toList();
      return RemoteTasksResponse(tasks: tasks);
    } catch (e) {
      throw GrpcError.internal('Failed to fetch tasks');
    }
  }

  @override
  Stream<RemoteOwnTaskResponse> fetchFromOwnServer(
      ServiceCall call, RemoteEmpty request) async* {
    final ownServer = OwnServer();
    try {
      await for (var task in ownServer.client.fetchFromOwnServer(request)) {
        yield RemoteOwnTaskResponse(
          id: task.id,
          title: task.title,
          completed: task.completed,
        );
      }
    } catch (e) {
      print("Error fetching from own server: $e");
      throw GrpcError.internal('Failed to fetch tasks from own server');
    } finally {
      await ownServer
          .shutdown();
    }
  }
}
