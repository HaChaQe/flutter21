import 'package:flutter/material.dart';
import 'package:flutter21/day12/services/api_service.dart';
import '../models/post.dart';

class PostsProvider extends ChangeNotifier {
  final List<Post> _posts = [];
  bool _isLoading = false;
  // ignore: avoid_init_to_null
  String? _errorMessage = null;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadPosts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final result = await ApiService().getPosts();
      _posts.clear();
      _posts.addAll(result);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}