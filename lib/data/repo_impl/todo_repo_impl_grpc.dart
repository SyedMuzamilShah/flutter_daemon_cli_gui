import 'package:grpc/service_api.dart';
import 'package:mnm/data/repo/todo_repo.dart';
import 'package:mnm/core/generated/todo.pbgrpc.dart' as pb;
import 'package:mnm/model/local_todo_model.dart';

class LocalTodoGrpcImp implements LocalTaskClientRepo {
  final ClientChannel channel;
  final pb.TodoServiceClient _stub;
  LocalTodoGrpcImp(this.channel) : _stub = pb.TodoServiceClient(channel);

  @override
  Future<TodoModel> addTask(String title) async {
    final request = await _stub.addTask(pb.AddTaskRequest()..title = title);
    return _fromPb(request);
  }

  @override
  Future<void> deleteTask(int id) async {
    await _stub.deleteTask(pb.DeleteTaskRequest()..id = id);
  }

  @override
  Future<List<TodoModel>> listTasks() async {
    final response = await _stub.listTasks(pb.Empty());
    final data = response.tasks.map(_fromPb).toList();
    return data;
  }

  @override
  Future<TodoModel> toggleTask(int id, bool completed) async {
    final response = await _stub.toggleTask(
      pb.ToggleTaskRequest()
        ..id = id
        ..completed = completed,
    );
    return _fromPb(response);
  }

  TodoModel _fromPb(pb.TaskResponse t) =>
      TodoModel(t.id.toString(), t.title, t.completed);
      
  @override
  Future<void> dispose() async{
    await channel.shutdown();
  }
}
