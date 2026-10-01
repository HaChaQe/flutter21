// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '21 days of Flutter',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   int counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("My App"), elevation: 0),
//       body: Column(
//         children: [
//           Text("Hello Flutter"),
//           SizedBox(height: 10),
//           Text("Counter $counter"),
//           SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [Text("DIO"), SizedBox(width: 10,), Text("Rainbow")]),
//           SizedBox(height: 10),
//           ElevatedButton(onPressed: () {setState(() {
//             counter++;
//           });}, child: Text("[+1]")),
//         ],
//       ),
//     );
//   }
// }
