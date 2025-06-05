import 'package:counter_app_flutter_bloc/model/post_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Post>> fetchUsers() async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      List data = response.data;
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
