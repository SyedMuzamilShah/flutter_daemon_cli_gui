import 'package:mnm/data/repo/auth_repo.dart';
import 'package:http/http.dart' as http;

class AuthRepoImpl implements AuthRepo {
  final String baseUrl;
  AuthRepoImpl({this.baseUrl = 'http://localhost:8080/sso'});

  @override
  Future<String> signInWithGoogle() async {
    final response = await http.get(Uri.parse('$baseUrl/google'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to sign in with Google');
    }
  }

  @override
  Future<void> signOut() async {
    final response = await http.get(Uri.parse('$baseUrl/signout'));
    if (response.statusCode != 200) {
      throw Exception('Failed to sign out');
    }
  }
}
