import 'package:mnm/data/repo/auth_repo.dart';
import 'package:mnm/data/repo/remote_repo.dart';
import 'package:mnm/data/repo/todo_repo.dart';
import 'package:mnm/data/repo_impl/auth_repo_impl.dart';
import 'package:mnm/data/repo_impl/remote_repo_impl.dart';
import 'package:mnm/data/repo_impl/todo_repo_impl.dart';

LocalTaskClientRepo createCoreClient () => LocalTodoRepoImpl();

RemoteClientRepo createRemoteClient() => RemoteRepoImpl();

AuthClientRepo createAuthClient() => AuthRepoImpl();