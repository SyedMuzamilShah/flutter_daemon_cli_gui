// This is a generated file - do not edit.
//
// Generated from todo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();

  Empty._();

  factory Empty.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Empty.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Empty',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty)) as Empty;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  @$core.override
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class AddTaskRequest extends $pb.GeneratedMessage {
  factory AddTaskRequest({
    $core.String? title,
  }) {
    final result = create();
    if (title != null) result.title = title;
    return result;
  }

  AddTaskRequest._();

  factory AddTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddTaskRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddTaskRequest clone() => AddTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddTaskRequest copyWith(void Function(AddTaskRequest) updates) =>
      super.copyWith((message) => updates(message as AddTaskRequest))
          as AddTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTaskRequest create() => AddTaskRequest._();
  @$core.override
  AddTaskRequest createEmptyInstance() => create();
  static $pb.PbList<AddTaskRequest> createRepeated() =>
      $pb.PbList<AddTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static AddTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddTaskRequest>(create);
  static AddTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);
}

class ToggleTaskRequest extends $pb.GeneratedMessage {
  factory ToggleTaskRequest({
    $core.int? id,
    $core.bool? completed,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (completed != null) result.completed = completed;
    return result;
  }

  ToggleTaskRequest._();

  factory ToggleTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ToggleTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ToggleTaskRequest',
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOB(2, _omitFieldNames ? '' : 'completed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ToggleTaskRequest clone() => ToggleTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ToggleTaskRequest copyWith(void Function(ToggleTaskRequest) updates) =>
      super.copyWith((message) => updates(message as ToggleTaskRequest))
          as ToggleTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ToggleTaskRequest create() => ToggleTaskRequest._();
  @$core.override
  ToggleTaskRequest createEmptyInstance() => create();
  static $pb.PbList<ToggleTaskRequest> createRepeated() =>
      $pb.PbList<ToggleTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static ToggleTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ToggleTaskRequest>(create);
  static ToggleTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get completed => $_getBF(1);
  @$pb.TagNumber(2)
  set completed($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCompleted() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompleted() => $_clearField(2);
}

class DeleteTaskRequest extends $pb.GeneratedMessage {
  factory DeleteTaskRequest({
    $core.int? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  DeleteTaskRequest._();

  factory DeleteTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteTaskRequest',
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTaskRequest clone() => DeleteTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTaskRequest copyWith(void Function(DeleteTaskRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteTaskRequest))
          as DeleteTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTaskRequest create() => DeleteTaskRequest._();
  @$core.override
  DeleteTaskRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTaskRequest> createRepeated() =>
      $pb.PbList<DeleteTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteTaskRequest>(create);
  static DeleteTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class TaskResponse extends $pb.GeneratedMessage {
  factory TaskResponse({
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

  TaskResponse._();

  factory TaskResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskResponse',
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOB(3, _omitFieldNames ? '' : 'completed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskResponse clone() => TaskResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskResponse copyWith(void Function(TaskResponse) updates) =>
      super.copyWith((message) => updates(message as TaskResponse))
          as TaskResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskResponse create() => TaskResponse._();
  @$core.override
  TaskResponse createEmptyInstance() => create();
  static $pb.PbList<TaskResponse> createRepeated() =>
      $pb.PbList<TaskResponse>();
  @$core.pragma('dart2js:noInline')
  static TaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskResponse>(create);
  static TaskResponse? _defaultInstance;

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

class TaskListResponse extends $pb.GeneratedMessage {
  factory TaskListResponse({
    $core.Iterable<TaskResponse>? tasks,
  }) {
    final result = create();
    if (tasks != null) result.tasks.addAll(tasks);
    return result;
  }

  TaskListResponse._();

  factory TaskListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskListResponse',
      createEmptyInstance: create)
    ..pc<TaskResponse>(1, _omitFieldNames ? '' : 'tasks', $pb.PbFieldType.PM,
        subBuilder: TaskResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskListResponse clone() => TaskListResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskListResponse copyWith(void Function(TaskListResponse) updates) =>
      super.copyWith((message) => updates(message as TaskListResponse))
          as TaskListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskListResponse create() => TaskListResponse._();
  @$core.override
  TaskListResponse createEmptyInstance() => create();
  static $pb.PbList<TaskListResponse> createRepeated() =>
      $pb.PbList<TaskListResponse>();
  @$core.pragma('dart2js:noInline')
  static TaskListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskListResponse>(create);
  static TaskListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TaskResponse> get tasks => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
