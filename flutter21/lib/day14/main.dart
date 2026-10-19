import 'package:flutter/material.dart';
import 'package:flutter21/day14/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter21/day15/notes_page.dart';
import 'package:flutter21/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
    );
  }
}