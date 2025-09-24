// This is a generated file - do not edit.
//
// Generated from remote_todo.proto.

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

import 'remote_todo.pb.dart' as $0;

export 'remote_todo.pb.dart';

@$pb.GrpcServiceName('mnm.RemoteTasksService')
class RemoteTasksServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  RemoteTasksServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.RemoteTasksResponse> fetchRemoteTasks(
    $0.RemoteEmpty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fetchRemoteTasks, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoteTask> fetchRemoteTaskById(
    $0.FetchTaskByIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fetchRemoteTaskById, request, options: options);
  }

  $grpc.ResponseStream<$0.RemoteOwnTaskResponse> fetchFromOwnServer(
    $0.RemoteEmpty request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$fetchFromOwnServer, $async.Stream.fromIterable([request]),
        options: options);
  }

  // method descriptors

  static final _$fetchRemoteTasks =
      $grpc.ClientMethod<$0.RemoteEmpty, $0.RemoteTasksResponse>(
          '/mnm.RemoteTasksService/FetchRemoteTasks',
          ($0.RemoteEmpty value) => value.writeToBuffer(),
          $0.RemoteTasksResponse.fromBuffer);
  static final _$fetchRemoteTaskById =
      $grpc.ClientMethod<$0.FetchTaskByIdRequest, $0.RemoteTask>(
          '/mnm.RemoteTasksService/FetchRemoteTaskById',
          ($0.FetchTaskByIdRequest value) => value.writeToBuffer(),
          $0.RemoteTask.fromBuffer);
  static final _$fetchFromOwnServer =
      $grpc.ClientMethod<$0.RemoteEmpty, $0.RemoteOwnTaskResponse>(
          '/mnm.RemoteTasksService/FetchFromOwnServer',
          ($0.RemoteEmpty value) => value.writeToBuffer(),
          $0.RemoteOwnTaskResponse.fromBuffer);
}

@$pb.GrpcServiceName('mnm.RemoteTasksService')
abstract class RemoteTasksServiceBase extends $grpc.Service {
  $core.String get $name => 'mnm.RemoteTasksService';

  RemoteTasksServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RemoteEmpty, $0.RemoteTasksResponse>(
        'FetchRemoteTasks',
        fetchRemoteTasks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoteEmpty.fromBuffer(value),
        ($0.RemoteTasksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchTaskByIdRequest, $0.RemoteTask>(
        'FetchRemoteTaskById',
        fetchRemoteTaskById_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchTaskByIdRequest.fromBuffer(value),
        ($0.RemoteTask value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoteEmpty, $0.RemoteOwnTaskResponse>(
        'FetchFromOwnServer',
        fetchFromOwnServer_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.RemoteEmpty.fromBuffer(value),
        ($0.RemoteOwnTaskResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RemoteTasksResponse> fetchRemoteTasks_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.RemoteEmpty> $request) async {
    return fetchRemoteTasks($call, await $request);
  }

  $async.Future<$0.RemoteTasksResponse> fetchRemoteTasks(
      $grpc.ServiceCall call, $0.RemoteEmpty request);

  $async.Future<$0.RemoteTask> fetchRemoteTaskById_Pre($grpc.ServiceCall $call,
      $async.Future<$0.FetchTaskByIdRequest> $request) async {
    return fetchRemoteTaskById($call, await $request);
  }

  $async.Future<$0.RemoteTask> fetchRemoteTaskById(
      $grpc.ServiceCall call, $0.FetchTaskByIdRequest request);

  $async.Stream<$0.RemoteOwnTaskResponse> fetchFromOwnServer_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.RemoteEmpty> $request) async* {
    yield* fetchFromOwnServer($call, await $request);
  }

  $async.Stream<$0.RemoteOwnTaskResponse> fetchFromOwnServer(
      $grpc.ServiceCall call, $0.RemoteEmpty request);
}
