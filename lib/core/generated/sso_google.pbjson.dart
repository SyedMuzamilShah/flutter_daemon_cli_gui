// This is a generated file - do not edit.
//
// Generated from sso_google.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use authEmptyDescriptor instead')
const AuthEmpty$json = {
  '1': 'AuthEmpty',
};

/// Descriptor for `AuthEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authEmptyDescriptor =
    $convert.base64Decode('CglBdXRoRW1wdHk=');

@$core.Deprecated('Use signInWithGoogleResponseDescriptor instead')
const SignInWithGoogleResponse$json = {
  '1': 'SignInWithGoogleResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SignInWithGoogleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signInWithGoogleResponseDescriptor =
    $convert.base64Decode(
        'ChhTaWduSW5XaXRoR29vZ2xlUmVzcG9uc2USFAoFdG9rZW4YASABKAlSBXRva2VuEhgKB21lc3'
        'NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use isLoggedInResponseDescriptor instead')
const IsLoggedInResponse$json = {
  '1': 'IsLoggedInResponse',
  '2': [
    {'1': 'is_logged_in', '3': 1, '4': 1, '5': 8, '10': 'isLoggedIn'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `IsLoggedInResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isLoggedInResponseDescriptor = $convert.base64Decode(
    'ChJJc0xvZ2dlZEluUmVzcG9uc2USIAoMaXNfbG9nZ2VkX2luGAEgASgIUgppc0xvZ2dlZEluEh'
    'gKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use getTokenResponseDescriptor instead')
const GetTokenResponse$json = {
  '1': 'GetTokenResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'expires_in', '3': 3, '4': 1, '5': 3, '10': 'expiresIn'},
  ],
};

/// Descriptor for `GetTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTokenResponseDescriptor = $convert.base64Decode(
    'ChBHZXRUb2tlblJlc3BvbnNlEiEKDGFjY2Vzc190b2tlbhgBIAEoCVILYWNjZXNzVG9rZW4SIw'
    'oNcmVmcmVzaF90b2tlbhgCIAEoCVIMcmVmcmVzaFRva2VuEh0KCmV4cGlyZXNfaW4YAyABKANS'
    'CWV4cGlyZXNJbg==');

@$core.Deprecated('Use signOutResponseDescriptor instead')
const SignOutResponse$json = {
  '1': 'SignOutResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SignOutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signOutResponseDescriptor = $convert.base64Decode(
    'Cg9TaWduT3V0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGA'
    'IgASgJUgdtZXNzYWdl');
