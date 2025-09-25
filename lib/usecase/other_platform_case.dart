import 'package:grpc/grpc.dart';
import 'package:mnm/data/repo/remote_repo.dart';
import 'package:mnm/data/repo/todo_repo.dart';
import 'package:mnm/data/repo_impl/remote_repo_impl_grpc.dart';
import 'package:mnm/data/repo_impl/todo_repo_impl_grpc.dart';
import 'package:mnm/core/generated/todo.pbgrpc.dart' as pb;
import 'package:mnm/core/generated/remote_todo.pbgrpc.dart' as pb_remote;
LocalTaskClientRepo createCoreClient(){
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub = pb.TodoServiceClient(channel);

  return LocalTodoGrpcImp(channel, stub);
}


RemoteClientRepo createRemoteClient() {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub = pb_remote.RemoteTasksServiceClient(channel);
  return RemoteTodoGrpcImpl(channel, stub);
}