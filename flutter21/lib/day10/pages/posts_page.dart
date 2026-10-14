import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/api_service.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Post> posts = [];
  bool isLoading = true;
  String? errorMessage;

  Future<void> loadPosts() async {

    setState(() {
        errorMessage = null;
        isLoading = true;
      });

    try {
      final result = await ApiService().getPosts();

      if (!mounted) return;

      setState(() {
        posts = result;
        errorMessage = null;
        isLoading = false;
      });

    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post List")),
      body: isLoading
      ? Center(child: CircularProgressIndicator())
      : errorMessage != null

      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(errorMessage!),
              ElevatedButton(onPressed: loadPosts, child: Text("Tekrar Dene"))
            ],
          ),
        )
      : ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(posts[index].title),
            );
          },
        )
      
    );
  }
}
