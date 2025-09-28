import 'package:mnm/data/repo/auth_repo.dart';
import 'package:mnm/data/repo/remote_repo.dart';
import 'package:mnm/data/repo/todo_repo.dart';

import 'web_case.dart'
  if (dart.library.io) 'grpc_platform_case.dart' as impl;

LocalTaskClientRepo createCoreClientInstance() => impl.createCoreClient();

RemoteClientRepo createRemoteClientInstance() => impl.createRemoteClient();

AuthClientRepo createAuthClientInstance() => impl.createAuthClient();