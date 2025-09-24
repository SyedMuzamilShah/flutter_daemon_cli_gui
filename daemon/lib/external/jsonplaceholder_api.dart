import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class ExternalApi {
  Future<List<Map<String, dynamic>>> fetchTodos();
  Future<Map<String, dynamic>> fetchTodoById(int id);
}


class JsonPlaceHolderApiImpl implements ExternalApi {
  final String baseUrl;

  JsonPlaceHolderApiImpl({this.baseUrl = 'https://jsonplaceholder.typicode.com'});

  @override
  Future<List<Map<String, dynamic>>> fetchTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/todos'));
    print("Testing");
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<Map<String, dynamic>> fetchTodoById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/todos/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load todo with id $id');
    }
  }
}