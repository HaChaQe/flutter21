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

  Task({required this.title, this.description = "", this.isCompleted = false});
}

class _MyAppState extends State<MyApp> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int? editingIndex;

  List<Task> taskList = [
    Task(title: "Run", description: "Run awayyy!", isCompleted: true),
    Task(title: "Eat", description: "Eating the Cannibals"),
    Task(title: "Sleep", description: "Sleep well"),
    Task(title: "Go to Market", description: "I speed at night, yay!"),
    Task(title: "Go to Market"),
  ];

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(
            child: Text(
              "TASK MANAGER",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 2,
                child: SizedBox(
                  width: 380,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.black87
                              ),
                              labelText: "Task Name:",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide:  BorderSide(
                                  color: Colors.blueGrey,
                                ),  
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide:  BorderSide(
                                  color: Colors.blueGrey,
                                ),  
                              )
                            ),
                            controller: titleController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Title cannot be empty";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: descriptionController,
                             decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.black87
                              ),
                              labelText: "Description:",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide:  BorderSide(
                                  color: Colors.blueGrey,
                                ),  
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide:  BorderSide(
                                  color: Colors.blueGrey,
                                ),  
                              )
                            ),
                          ),
                        ),
                        editingIndex == null
                            ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    child: const Text("+ ADD TASK", style: TextStyle(color: Colors.black87),),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        setState(() {
                                          taskList.add(
                                            Task(
                                              title: titleController.text.trim(),
                                              description: descriptionController.text
                                                  .trim(),
                                            ),
                                          );
                                        });
                                        titleController.clear();
                                        descriptionController.clear();
                                      }
                                    },
                                  ),
                              ),
                            )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      child: const Text("UPDATE", style: TextStyle(color: Colors.black87),),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          setState(() {
                                            taskList[editingIndex!].title =
                                                titleController.text.trim();
                                            taskList[editingIndex!].description =
                                                descriptionController.text.trim();
                                                  
                                            editingIndex = null;
                                          });
                                          titleController.clear();
                                          descriptionController.clear();
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  OutlinedButton(
                                    child: const Text("CANCEL",style: TextStyle(color: Colors.black87),),
                                    onPressed: () {
                                      setState(() {
                                        editingIndex = null;
                                      });
                                      titleController.clear();
                                      descriptionController.clear();
                                    },
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
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
                                      : TextDecoration.none,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.description.isNotEmpty
                                        ? task.description
                                        : "There is no description.",
                                  ),
                                  Text(
                                    task.isCompleted
                                        ? "Completed!"
                                        : "Pending...",
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    activeColor: Colors.blueGrey,
                                    checkColor: Colors.white,
                                    side: BorderSide(color: Colors.black54),
                                    value: task.isCompleted,
                                    onChanged: (value) {
                                      setState(() {
                                        if (value != null) {
                                          task.isCompleted = value;
                                        }
                                      });
                                    },
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        taskList.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        titleController.text = task.title;
                                        descriptionController.text =
                                            task.description;
                                        editingIndex = index;
                                      });
                                    },
                                    icon: Icon(Icons.edit_note_sharp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(child: Text("No tasks yet..",style: TextStyle(fontSize: 16),)),
            ),
          ],
        ),
      ),
    );
  }
}
