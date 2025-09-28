import 'package:grpc/grpc.dart';
import 'package:mnm/core/generated/sso_google.pbgrpc.dart';
import 'package:mnm/state/google_sso_signals.dart';

class GoogleServices extends GoogleSSOServiceBase {
  GoogleSsoSignals signals = GoogleSsoSignals();
  GoogleServices();
  @override
  Future<GetTokenResponse> getToken(ServiceCall call, AuthEmpty request) async {
    try {
      final token = await signals.getToken();
      print(token);
      return GetTokenResponse()
        ..accessToken = token
        ..refreshToken = "RefreshTokenPlaceholder";
    } catch (e) {
      throw GrpcError.unauthenticated(e.toString());
    }
  }

  @override
  Future<SignInWithGoogleResponse> signInWithGoogle(
      ServiceCall call, AuthEmpty request) async {
    try {
      
      final response = await signals.signInWithGoogle();
      return SignInWithGoogleResponse()
      ..message = "SignIn successful"
      ..token = response;
    } catch (e) {
      print("Some Error Comed : $e");
      throw GrpcError.failedPrecondition('Google SSO sign-in failed: $e');
    }
  }

  @override
  Future<SignOutResponse> signOut(ServiceCall call, AuthEmpty request) async {
    try {
      await signals.signOut();
      return SignOutResponse()..message = "SignOut successful";
    } catch (e) {
      throw GrpcError.unauthenticated('User not authenticated');
    }
  }
  
  @override
  Future<IsLoggedInResponse> isLoggedIn(ServiceCall call, AuthEmpty request) async {
    try {
      final response = await signals.isLoggedIn();
      return IsLoggedInResponse()
        ..isLoggedIn = response
        ..message = response ? "User is logged in" : "User is not logged in";
    } catch (e) {
      throw GrpcError.unauthenticated('User not authenticated');
    }
  }
}
