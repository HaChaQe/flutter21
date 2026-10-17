import '../models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  Future <List<Post>> getPosts() async {

    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    try {
      final response = await http.get(url).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((data) => Post.fromJson(data)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }

  }

}