import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/posts_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PostsProvider()..loadPosts(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Post List"),),
        body: Center(
          child: Consumer<PostsProvider>(
            builder: (context, value, child) {
              return value.isLoading
              ? CircularProgressIndicator()
              : value.errorMessage != null
                ? Column(
                  children: [
                    Text(value.errorMessage!),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text("Tekrar Dene"),
                      onPressed: () => value.loadPosts(),
                    )
                  ],
                )
                : ListView.builder(
                  itemCount: value.posts.length,
                  itemBuilder: (context, index) {
                    return Text(value.posts[index].title);
                  },
                );
            },
          ),
        ),
      ),
    );
  }
}