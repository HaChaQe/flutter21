import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class Task {
  String title;
  String description;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}

class _MyAppState extends State<MyApp> {

  List<Task> taskList = [
    Task(title: "Run", description: "Run awayyy!", isCompleted: true),
    Task(title: "Eat", description: "Eating the Cannibals"),
    Task(title: "Sleep", description: "Sleep well"),
    Task(title: "Go to Market", description: "I speed at night, yay!")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Expanded(
          child: Center(
            child: taskList.isNotEmpty 
            ? ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isCompleted 
                          ? TextDecoration.lineThrough
                          : TextDecoration.none
                          ),
                        ),
                      subtitle: task.description.isEmpty ? null : Text(task.description),
                      trailing: task.isCompleted
                      ? const Icon(Icons.task_alt_rounded)
                      : const Icon(Icons.radio_button_off_rounded),
                    ),
                  ),
                );
              },
            )
            : Text("No tasks yet..")
          ),
        ),
      ),
    );
  }
}