// This is a generated file - do not edit.
//
// Generated from remote_todo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class RemoteEmpty extends $pb.GeneratedMessage {
  factory RemoteEmpty() => create();

  RemoteEmpty._();

  factory RemoteEmpty.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteEmpty.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteEmpty',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mnm'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteEmpty clone() => RemoteEmpty()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteEmpty copyWith(void Function(RemoteEmpty) updates) =>
      super.copyWith((message) => updates(message as RemoteEmpty))
          as RemoteEmpty;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteEmpty create() => RemoteEmpty._();
  @$core.override
  RemoteEmpty createEmptyInstance() => create();
  static $pb.PbList<RemoteEmpty> createRepeated() => $pb.PbList<RemoteEmpty>();
  @$core.pragma('dart2js:noInline')
  static RemoteEmpty getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteEmpty>(create);
  static RemoteEmpty? _defaultInstance;
}

class RemoteOwnTaskResponse extends $pb.GeneratedMessage {
  factory RemoteOwnTaskResponse({
    $core.int? id,
    $core.String? title,
    $core.bool? completed,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (completed != null) result.completed = completed;
    return result;
  }

  RemoteOwnTaskResponse._();

  factory RemoteOwnTaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteOwnTaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteOwnTaskResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mnm'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOB(3, _omitFieldNames ? '' : 'completed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteOwnTaskResponse clone() =>
      RemoteOwnTaskResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteOwnTaskResponse copyWith(
          void Function(RemoteOwnTaskResponse) updates) =>
      super.copyWith((message) => updates(message as RemoteOwnTaskResponse))
          as RemoteOwnTaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteOwnTaskResponse create() => RemoteOwnTaskResponse._();
  @$core.override
  RemoteOwnTaskResponse createEmptyInstance() => create();
  static $pb.PbList<RemoteOwnTaskResponse> createRepeated() =>
      $pb.PbList<RemoteOwnTaskResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoteOwnTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteOwnTaskResponse>(create);
  static RemoteOwnTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get completed => $_getBF(2);
  @$pb.TagNumber(3)
  set completed($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCompleted() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompleted() => $_clearField(3);
}

class RemoteTask extends $pb.GeneratedMessage {
  factory RemoteTask({
    $core.int? userId,
    $core.int? id,
    $core.String? title,
    $core.bool? completed,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (completed != null) result.completed = completed;
    return result;
  }

  RemoteTask._();

  factory RemoteTask.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteTask.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteTask',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mnm'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3,
        protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOB(4, _omitFieldNames ? '' : 'completed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteTask clone() => RemoteTask()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteTask copyWith(void Function(RemoteTask) updates) =>
      super.copyWith((message) => updates(message as RemoteTask)) as RemoteTask;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteTask create() => RemoteTask._();
  @$core.override
  RemoteTask createEmptyInstance() => create();
  static $pb.PbList<RemoteTask> createRepeated() => $pb.PbList<RemoteTask>();
  @$core.pragma('dart2js:noInline')
  static RemoteTask getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteTask>(create);
  static RemoteTask? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get completed => $_getBF(3);
  @$pb.TagNumber(4)
  set completed($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCompleted() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompleted() => $_clearField(4);
}

class RemoteTasksResponse extends $pb.GeneratedMessage {
  factory RemoteTasksResponse({
    $core.Iterable<RemoteTask>? tasks,
  }) {
    final result = create();
    if (tasks != null) result.tasks.addAll(tasks);
    return result;
  }

  RemoteTasksResponse._();

  factory RemoteTasksResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteTasksResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteTasksResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mnm'),
      createEmptyInstance: create)
    ..pc<RemoteTask>(1, _omitFieldNames ? '' : 'tasks', $pb.PbFieldType.PM,
        subBuilder: RemoteTask.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteTasksResponse clone() => RemoteTasksResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteTasksResponse copyWith(void Function(RemoteTasksResponse) updates) =>
      super.copyWith((message) => updates(message as RemoteTasksResponse))
          as RemoteTasksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteTasksResponse create() => RemoteTasksResponse._();
  @$core.override
  RemoteTasksResponse createEmptyInstance() => create();
  static $pb.PbList<RemoteTasksResponse> createRepeated() =>
      $pb.PbList<RemoteTasksResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoteTasksResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteTasksResponse>(create);
  static RemoteTasksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RemoteTask> get tasks => $_getList(0);
}

class FetchTaskByIdRequest extends $pb.GeneratedMessage {
  factory FetchTaskByIdRequest({
    $core.int? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  FetchTaskByIdRequest._();

  factory FetchTaskByIdRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchTaskByIdRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchTaskByIdRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mnm'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchTaskByIdRequest clone() =>
      FetchTaskByIdRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchTaskByIdRequest copyWith(void Function(FetchTaskByIdRequest) updates) =>
      super.copyWith((message) => updates(message as FetchTaskByIdRequest))
          as FetchTaskByIdRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchTaskByIdRequest create() => FetchTaskByIdRequest._();
  @$core.override
  FetchTaskByIdRequest createEmptyInstance() => create();
  static $pb.PbList<FetchTaskByIdRequest> createRepeated() =>
      $pb.PbList<FetchTaskByIdRequest>();
  @$core.pragma('dart2js:noInline')
  static FetchTaskByIdRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchTaskByIdRequest>(create);
  static FetchTaskByIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
