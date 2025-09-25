import 'package:mnm/data/repo/remote_repo.dart';
import 'package:mnm/data/repo/todo_repo.dart';

import 'web_case.dart'
  if (dart.library.io) 'other_platform_case.dart' as impl;

LocalTaskClientRepo createCoreClientInstance() => impl.createCoreClient();

RemoteClientRepo createRemoteClientInstance() => impl.createRemoteClient();