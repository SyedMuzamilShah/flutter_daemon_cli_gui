// This is a generated file - do not edit.
//
// Generated from remote_todo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use remoteEmptyDescriptor instead')
const RemoteEmpty$json = {
  '1': 'RemoteEmpty',
};

/// Descriptor for `RemoteEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteEmptyDescriptor =
    $convert.base64Decode('CgtSZW1vdGVFbXB0eQ==');

@$core.Deprecated('Use remoteTaskDescriptor instead')
const RemoteTask$json = {
  '1': 'RemoteTask',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'completed', '3': 4, '4': 1, '5': 8, '10': 'completed'},
  ],
};

/// Descriptor for `RemoteTask`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteTaskDescriptor = $convert.base64Decode(
    'CgpSZW1vdGVUYXNrEhYKBnVzZXJJZBgBIAEoBVIGdXNlcklkEg4KAmlkGAIgASgFUgJpZBIUCg'
    'V0aXRsZRgDIAEoCVIFdGl0bGUSHAoJY29tcGxldGVkGAQgASgIUgljb21wbGV0ZWQ=');

@$core.Deprecated('Use remoteTasksResponseDescriptor instead')
const RemoteTasksResponse$json = {
  '1': 'RemoteTasksResponse',
  '2': [
    {
      '1': 'tasks',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.mnm.RemoteTask',
      '10': 'tasks'
    },
  ],
};

/// Descriptor for `RemoteTasksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteTasksResponseDescriptor = $convert.base64Decode(
    'ChNSZW1vdGVUYXNrc1Jlc3BvbnNlEiUKBXRhc2tzGAEgAygLMg8ubW5tLlJlbW90ZVRhc2tSBX'
    'Rhc2tz');

@$core.Deprecated('Use fetchTaskByIdRequestDescriptor instead')
const FetchTaskByIdRequest$json = {
  '1': 'FetchTaskByIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `FetchTaskByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchTaskByIdRequestDescriptor = $convert
    .base64Decode('ChRGZXRjaFRhc2tCeUlkUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');
