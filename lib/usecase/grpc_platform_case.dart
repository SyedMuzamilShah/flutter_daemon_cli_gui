import 'package:grpc/grpc.dart';
import 'package:mnm/data/repo/auth_repo.dart';
import 'package:mnm/data/repo/remote_repo.dart';
import 'package:mnm/data/repo/todo_repo.dart';
import 'package:mnm/data/repo_impl/auth_repo_impl_grpc.dart';
import 'package:mnm/data/repo_impl/remote_repo_impl_grpc.dart';
import 'package:mnm/data/repo_impl/todo_repo_impl_grpc.dart';

LocalTaskClientRepo createCoreClient() => LocalTodoGrpcImp(_channel);

RemoteClientRepo createRemoteClient() => RemoteTodoGrpcImpl(_channel);

AuthClientRepo createAuthClient() => AuthRepoImplGRPC(_channel);

final ClientChannel _channel = ClientChannel(
  'localhost',
  port: 50051,
  options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
);
