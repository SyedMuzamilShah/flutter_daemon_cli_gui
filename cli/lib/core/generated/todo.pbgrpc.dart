// This is a generated file - do not edit.
//
// Generated from todo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'todo.pb.dart' as $0;

export 'todo.pb.dart';

@$pb.GrpcServiceName('TodoService')
class TodoServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  TodoServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.TaskResponse> addTask(
    $0.AddTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskListResponse> listTasks(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listTasks, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskResponse> toggleTask(
    $0.ToggleTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$toggleTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteTask(
    $0.DeleteTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteTask, request, options: options);
  }

  // method descriptors

  static final _$addTask =
      $grpc.ClientMethod<$0.AddTaskRequest, $0.TaskResponse>(
          '/TodoService/AddTask',
          ($0.AddTaskRequest value) => value.writeToBuffer(),
          $0.TaskResponse.fromBuffer);
  static final _$listTasks = $grpc.ClientMethod<$0.Empty, $0.TaskListResponse>(
      '/TodoService/ListTasks',
      ($0.Empty value) => value.writeToBuffer(),
      $0.TaskListResponse.fromBuffer);
  static final _$toggleTask =
      $grpc.ClientMethod<$0.ToggleTaskRequest, $0.TaskResponse>(
          '/TodoService/ToggleTask',
          ($0.ToggleTaskRequest value) => value.writeToBuffer(),
          $0.TaskResponse.fromBuffer);
  static final _$deleteTask =
      $grpc.ClientMethod<$0.DeleteTaskRequest, $0.Empty>(
          '/TodoService/DeleteTask',
          ($0.DeleteTaskRequest value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('TodoService')
abstract class TodoServiceBase extends $grpc.Service {
  $core.String get $name => 'TodoService';

  TodoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddTaskRequest, $0.TaskResponse>(
        'AddTask',
        addTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddTaskRequest.fromBuffer(value),
        ($0.TaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.TaskListResponse>(
        'ListTasks',
        listTasks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.TaskListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ToggleTaskRequest, $0.TaskResponse>(
        'ToggleTask',
        toggleTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ToggleTaskRequest.fromBuffer(value),
        ($0.TaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTaskRequest, $0.Empty>(
        'DeleteTask',
        deleteTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteTaskRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.TaskResponse> addTask_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddTaskRequest> $request) async {
    return addTask($call, await $request);
  }

  $async.Future<$0.TaskResponse> addTask(
      $grpc.ServiceCall call, $0.AddTaskRequest request);

  $async.Future<$0.TaskListResponse> listTasks_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return listTasks($call, await $request);
  }

  $async.Future<$0.TaskListResponse> listTasks(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.TaskResponse> toggleTask_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ToggleTaskRequest> $request) async {
    return toggleTask($call, await $request);
  }

  $async.Future<$0.TaskResponse> toggleTask(
      $grpc.ServiceCall call, $0.ToggleTaskRequest request);

  $async.Future<$0.Empty> deleteTask_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteTaskRequest> $request) async {
    return deleteTask($call, await $request);
  }

  $async.Future<$0.Empty> deleteTask(
      $grpc.ServiceCall call, $0.DeleteTaskRequest request);
}
