import 'package:mnm/data/repo/auth_repo.dart';
import 'package:http/http.dart' as http;

class AuthRepoImpl implements AuthClientRepo {
  final String baseUrl;
  AuthRepoImpl({this.baseUrl = 'http://localhost:8080/auth/google'});

  @override
  Future<String> signInWithGoogle() async {
    final response = await http.post(Uri.parse('$baseUrl/login'));
    print(response.body);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<void> signOut() async {
    final response = await http.post(Uri.parse('$baseUrl/logout'));
    if (response.statusCode != 204) {
      throw Exception(response.body);
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final response = await http.get(Uri.parse('$baseUrl/status'));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return true;
  }
}
