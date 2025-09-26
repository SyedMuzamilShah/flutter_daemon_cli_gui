// This is a generated file - do not edit.
//
// Generated from sso_google.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class AuthEmpty extends $pb.GeneratedMessage {
  factory AuthEmpty() => create();

  AuthEmpty._();

  factory AuthEmpty.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthEmpty.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthEmpty',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sso_google'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthEmpty clone() => AuthEmpty()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthEmpty copyWith(void Function(AuthEmpty) updates) =>
      super.copyWith((message) => updates(message as AuthEmpty)) as AuthEmpty;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthEmpty create() => AuthEmpty._();
  @$core.override
  AuthEmpty createEmptyInstance() => create();
  static $pb.PbList<AuthEmpty> createRepeated() => $pb.PbList<AuthEmpty>();
  @$core.pragma('dart2js:noInline')
  static AuthEmpty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthEmpty>(create);
  static AuthEmpty? _defaultInstance;
}

class SignInWithGoogleResponse extends $pb.GeneratedMessage {
  factory SignInWithGoogleResponse({
    $core.String? token,
    $core.String? message,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (message != null) result.message = message;
    return result;
  }

  SignInWithGoogleResponse._();

  factory SignInWithGoogleResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignInWithGoogleResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignInWithGoogleResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sso_google'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignInWithGoogleResponse clone() =>
      SignInWithGoogleResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignInWithGoogleResponse copyWith(
          void Function(SignInWithGoogleResponse) updates) =>
      super.copyWith((message) => updates(message as SignInWithGoogleResponse))
          as SignInWithGoogleResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignInWithGoogleResponse create() => SignInWithGoogleResponse._();
  @$core.override
  SignInWithGoogleResponse createEmptyInstance() => create();
  static $pb.PbList<SignInWithGoogleResponse> createRepeated() =>
      $pb.PbList<SignInWithGoogleResponse>();
  @$core.pragma('dart2js:noInline')
  static SignInWithGoogleResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignInWithGoogleResponse>(create);
  static SignInWithGoogleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class IsLoggedInResponse extends $pb.GeneratedMessage {
  factory IsLoggedInResponse({
    $core.bool? isLoggedIn,
    $core.String? message,
  }) {
    final result = create();
    if (isLoggedIn != null) result.isLoggedIn = isLoggedIn;
    if (message != null) result.message = message;
    return result;
  }

  IsLoggedInResponse._();

  factory IsLoggedInResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IsLoggedInResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IsLoggedInResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sso_google'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isLoggedIn')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IsLoggedInResponse clone() => IsLoggedInResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IsLoggedInResponse copyWith(void Function(IsLoggedInResponse) updates) =>
      super.copyWith((message) => updates(message as IsLoggedInResponse))
          as IsLoggedInResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IsLoggedInResponse create() => IsLoggedInResponse._();
  @$core.override
  IsLoggedInResponse createEmptyInstance() => create();
  static $pb.PbList<IsLoggedInResponse> createRepeated() =>
      $pb.PbList<IsLoggedInResponse>();
  @$core.pragma('dart2js:noInline')
  static IsLoggedInResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IsLoggedInResponse>(create);
  static IsLoggedInResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isLoggedIn => $_getBF(0);
  @$pb.TagNumber(1)
  set isLoggedIn($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsLoggedIn() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsLoggedIn() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class GetTokenResponse extends $pb.GeneratedMessage {
  factory GetTokenResponse({
    $core.String? accessToken,
    $core.String? refreshToken,
    $fixnum.Int64? expiresIn,
  }) {
    final result = create();
    if (accessToken != null) result.accessToken = accessToken;
    if (refreshToken != null) result.refreshToken = refreshToken;
    if (expiresIn != null) result.expiresIn = expiresIn;
    return result;
  }

  GetTokenResponse._();

  factory GetTokenResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTokenResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTokenResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sso_google'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken')
    ..aInt64(3, _omitFieldNames ? '' : 'expiresIn')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTokenResponse clone() => GetTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTokenResponse copyWith(void Function(GetTokenResponse) updates) =>
      super.copyWith((message) => updates(message as GetTokenResponse))
          as GetTokenResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTokenResponse create() => GetTokenResponse._();
  @$core.override
  GetTokenResponse createEmptyInstance() => create();
  static $pb.PbList<GetTokenResponse> createRepeated() =>
      $pb.PbList<GetTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTokenResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTokenResponse>(create);
  static GetTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expiresIn => $_getI64(2);
  @$pb.TagNumber(3)
  set expiresIn($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpiresIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresIn() => $_clearField(3);
}

class SignOutResponse extends $pb.GeneratedMessage {
  factory SignOutResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  SignOutResponse._();

  factory SignOutResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignOutResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignOutResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sso_google'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignOutResponse clone() => SignOutResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignOutResponse copyWith(void Function(SignOutResponse) updates) =>
      super.copyWith((message) => updates(message as SignOutResponse))
          as SignOutResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignOutResponse create() => SignOutResponse._();
  @$core.override
  SignOutResponse createEmptyInstance() => create();
  static $pb.PbList<SignOutResponse> createRepeated() =>
      $pb.PbList<SignOutResponse>();
  @$core.pragma('dart2js:noInline')
  static SignOutResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignOutResponse>(create);
  static SignOutResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
