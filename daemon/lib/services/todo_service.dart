import 'package:grpc/grpc.dart';
import '../state/todo_signals.dart';
import '../generated/todo.pbgrpc.dart';

class TodoServiceImpl extends TodoServiceBase {
  final TodoSignals signals;

  TodoServiceImpl(this.signals);

  @override
  Future<TaskResponse> addTask(ServiceCall call, AddTaskRequest request) async {
    await signals.addTask(request.title);
    final task = signals.tasks.value.last;
    return TaskResponse(
      id: task.id,
      title: task.title,
      completed: task.completed,
    );
  }

  @override
  Future<TaskListResponse> listTasks(ServiceCall call, Empty request) async {
    await signals.loadTasks();
    return TaskListResponse(
      tasks: signals.tasks.value
          .map((t) =>
              TaskResponse(id: t.id, title: t.title, completed: t.completed))
          .toList(),
    );
  }

  @override
  Future<TaskResponse> toggleTask(
      ServiceCall call, ToggleTaskRequest request) async {
    await signals.toggleTask(request.id, request.completed);
    final updated =
        signals.tasks.value.firstWhere((t) => t.id == request.id);
    return TaskResponse(
      id: updated.id,
      title: updated.title,
      completed: updated.completed,
    );
  }

  @override
  Future<Empty> deleteTask(ServiceCall call, DeleteTaskRequest request) async {
    await signals.deleteTask(request.id);
    return Empty();
  }
}
