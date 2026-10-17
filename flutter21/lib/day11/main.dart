import 'package:flutter/material.dart';
import 'package:flutter21/day11/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoriteProvider()..loadFavorite(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("MyApp build");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Day 11 of Flutter Minicamp"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<FavoriteProvider>(
                builder: (context, favorite, child) {
                  debugPrint("Consumer1 build");
                  return Icon(
                    favorite.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border
                  );
                },
              ),
              SizedBox(height: 10,),
              Consumer<FavoriteProvider>(
                builder: (context, favorite, child) {
                  debugPrint("Consumer2 build");
                  return Text(favorite.favoriteStatus);
                },
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                child: Text("Change Fav"),
                onPressed: () {
                  context.read<FavoriteProvider>().toggleFavorite();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}