import 'package:grpc/grpc.dart';
import 'package:mnm/external/jsonplaceholder_api.dart';
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
}
