import 'package:grpc/service_api.dart';
import 'package:mnm/data/repo/auth_repo.dart';
import 'package:mnm/core/generated/sso_google.pbgrpc.dart' as pb;

class AuthRepoImplGRPC implements AuthClientRepo {
  final ClientChannel channel;
  final pb.GoogleSSOServiceClient client;

  AuthRepoImplGRPC(this.channel) : client = pb.GoogleSSOServiceClient(channel);

  @override
  Future<String> signInWithGoogle() async {
    try {
      final response = await client.signInWithGoogle(pb.AuthEmpty());
      return response.token;
    } catch (e, _) {
      print('Error signing in with Google: $e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await client.signOut(pb.AuthEmpty());
    } catch (e, stack) {
      print('Error signing out: $e\n$stack');
      rethrow;
    }
  }
  
  @override
  Future<bool> isLoggedIn() async {
    try {
      final response = await client.isLoggedIn(pb.AuthEmpty());
      return response.isLoggedIn;
    } catch (e, _) {
      print('Error checking login status: $e');
      rethrow;
    }
  }
}
