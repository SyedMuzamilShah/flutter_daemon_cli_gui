import 'package:grpc/grpc.dart';
import 'package:mnm/core/generated/sso_google.pbgrpc.dart';
import 'package:mnm/external/google_sso.dart';

class GoogleServices extends GoogleSSOServiceBase {
  GoogleSSO googleSSO;
  GoogleServices(this.googleSSO);
  @override
  Future<GetTokenResponse> getToken(ServiceCall call, AuthEmpty request) async {
    try {
      final response = await googleSSO.getToken();
      print(response);
      return GetTokenResponse()
        ..accessToken = "AccessTokenPlaceholder"
        ..refreshToken = "RefreshTokenPlaceholder";
    } catch (e) {
      throw GrpcError.unauthenticated('User not authenticated');
    }
  }

  @override
  Future<SignInWithGoogleResponse> signInWithGoogle(
      ServiceCall call, AuthEmpty request) async {
    try {
      final response = await googleSSO.signInWithGoogle();
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
      await googleSSO.signOut();
      return SignOutResponse()..message = "SignOut successful";
    } catch (e) {
      throw GrpcError.unauthenticated('User not authenticated');
    }
  }
  
  @override
  Future<IsLoggedInResponse> isLoggedIn(ServiceCall call, AuthEmpty request) async {
    try {
      final response = await googleSSO.isLoggedIn();
      return IsLoggedInResponse()
        ..isLoggedIn = response
        ..message = response ? "User is logged in" : "User is not logged in";
    } catch (e) {
      throw GrpcError.unauthenticated('User not authenticated');
    }
  }
}
