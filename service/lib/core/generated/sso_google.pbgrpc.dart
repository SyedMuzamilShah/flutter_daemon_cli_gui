// This is a generated file - do not edit.
//
// Generated from sso_google.proto.

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

import 'sso_google.pb.dart' as $0;

export 'sso_google.pb.dart';

@$pb.GrpcServiceName('sso_google.GoogleSSOService')
class GoogleSSOServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  GoogleSSOServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SignInWithGoogleResponse> signInWithGoogle(
    $0.AuthEmpty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$signInWithGoogle, request, options: options);
  }

  $grpc.ResponseFuture<$0.IsLoggedInResponse> isLoggedIn(
    $0.AuthEmpty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$isLoggedIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTokenResponse> getToken(
    $0.AuthEmpty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.SignOutResponse> signOut(
    $0.AuthEmpty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$signOut, request, options: options);
  }

  // method descriptors

  static final _$signInWithGoogle =
      $grpc.ClientMethod<$0.AuthEmpty, $0.SignInWithGoogleResponse>(
          '/sso_google.GoogleSSOService/SignInWithGoogle',
          ($0.AuthEmpty value) => value.writeToBuffer(),
          $0.SignInWithGoogleResponse.fromBuffer);
  static final _$isLoggedIn =
      $grpc.ClientMethod<$0.AuthEmpty, $0.IsLoggedInResponse>(
          '/sso_google.GoogleSSOService/IsLoggedIn',
          ($0.AuthEmpty value) => value.writeToBuffer(),
          $0.IsLoggedInResponse.fromBuffer);
  static final _$getToken =
      $grpc.ClientMethod<$0.AuthEmpty, $0.GetTokenResponse>(
          '/sso_google.GoogleSSOService/GetToken',
          ($0.AuthEmpty value) => value.writeToBuffer(),
          $0.GetTokenResponse.fromBuffer);
  static final _$signOut = $grpc.ClientMethod<$0.AuthEmpty, $0.SignOutResponse>(
      '/sso_google.GoogleSSOService/SignOut',
      ($0.AuthEmpty value) => value.writeToBuffer(),
      $0.SignOutResponse.fromBuffer);
}

@$pb.GrpcServiceName('sso_google.GoogleSSOService')
abstract class GoogleSSOServiceBase extends $grpc.Service {
  $core.String get $name => 'sso_google.GoogleSSOService';

  GoogleSSOServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AuthEmpty, $0.SignInWithGoogleResponse>(
        'SignInWithGoogle',
        signInWithGoogle_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthEmpty.fromBuffer(value),
        ($0.SignInWithGoogleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AuthEmpty, $0.IsLoggedInResponse>(
        'IsLoggedIn',
        isLoggedIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthEmpty.fromBuffer(value),
        ($0.IsLoggedInResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AuthEmpty, $0.GetTokenResponse>(
        'GetToken',
        getToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthEmpty.fromBuffer(value),
        ($0.GetTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AuthEmpty, $0.SignOutResponse>(
        'SignOut',
        signOut_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthEmpty.fromBuffer(value),
        ($0.SignOutResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SignInWithGoogleResponse> signInWithGoogle_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.AuthEmpty> $request) async {
    return signInWithGoogle($call, await $request);
  }

  $async.Future<$0.SignInWithGoogleResponse> signInWithGoogle(
      $grpc.ServiceCall call, $0.AuthEmpty request);

  $async.Future<$0.IsLoggedInResponse> isLoggedIn_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.AuthEmpty> $request) async {
    return isLoggedIn($call, await $request);
  }

  $async.Future<$0.IsLoggedInResponse> isLoggedIn(
      $grpc.ServiceCall call, $0.AuthEmpty request);

  $async.Future<$0.GetTokenResponse> getToken_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.AuthEmpty> $request) async {
    return getToken($call, await $request);
  }

  $async.Future<$0.GetTokenResponse> getToken(
      $grpc.ServiceCall call, $0.AuthEmpty request);

  $async.Future<$0.SignOutResponse> signOut_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.AuthEmpty> $request) async {
    return signOut($call, await $request);
  }

  $async.Future<$0.SignOutResponse> signOut(
      $grpc.ServiceCall call, $0.AuthEmpty request);
}
