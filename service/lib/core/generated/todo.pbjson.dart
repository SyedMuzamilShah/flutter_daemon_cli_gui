// This is a generated file - do not edit.
//
// Generated from todo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor =
    $convert.base64Decode('CgVFbXB0eQ==');

@$core.Deprecated('Use addTaskRequestDescriptor instead')
const AddTaskRequest$json = {
  '1': 'AddTaskRequest',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `AddTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTaskRequestDescriptor = $convert
    .base64Decode('Cg5BZGRUYXNrUmVxdWVzdBIUCgV0aXRsZRgBIAEoCVIFdGl0bGU=');

@$core.Deprecated('Use toggleTaskRequestDescriptor instead')
const ToggleTaskRequest$json = {
  '1': 'ToggleTaskRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'completed', '3': 2, '4': 1, '5': 8, '10': 'completed'},
  ],
};

/// Descriptor for `ToggleTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toggleTaskRequestDescriptor = $convert.base64Decode(
    'ChFUb2dnbGVUYXNrUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSHAoJY29tcGxldGVkGAIgASgIUg'
    'ljb21wbGV0ZWQ=');

@$core.Deprecated('Use deleteTaskRequestDescriptor instead')
const DeleteTaskRequest$json = {
  '1': 'DeleteTaskRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `DeleteTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskRequestDescriptor =
    $convert.base64Decode('ChFEZWxldGVUYXNrUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');

@$core.Deprecated('Use taskResponseDescriptor instead')
const TaskResponse$json = {
  '1': 'TaskResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'completed', '3': 3, '4': 1, '5': 8, '10': 'completed'},
  ],
};

/// Descriptor for `TaskResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskResponseDescriptor = $convert.base64Decode(
    'CgxUYXNrUmVzcG9uc2USDgoCaWQYASABKAVSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIcCg'
    'ljb21wbGV0ZWQYAyABKAhSCWNvbXBsZXRlZA==');

@$core.Deprecated('Use taskListResponseDescriptor instead')
const TaskListResponse$json = {
  '1': 'TaskListResponse',
  '2': [
    {
      '1': 'tasks',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.TaskResponse',
      '10': 'tasks'
    },
  ],
};

/// Descriptor for `TaskListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskListResponseDescriptor = $convert.base64Decode(
    'ChBUYXNrTGlzdFJlc3BvbnNlEiMKBXRhc2tzGAEgAygLMg0uVGFza1Jlc3BvbnNlUgV0YXNrcw'
    '==');
