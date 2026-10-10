import 'package:flutter/material.dart';
import 'package:flutter21/ilk6/models/task.dart';
import 'package:flutter21/ilk6/screens/task_edit_page.dart';

class TaskDetailPage extends StatefulWidget {

  final Task task;

  const TaskDetailPage({
      super.key,
      required this.task
    });

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {

  late Task currentTask;

  @override
  void initState() {
    super.initState();
    currentTask = widget.task;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context, currentTask);
          },
          icon: Icon(Icons.keyboard_return_rounded, color: Colors.white,)
          ),
          backgroundColor: Colors.blueGrey,
          title: Text(
            "TASK DETAIL PAGE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            elevation: 3,
            child: SizedBox(
              width: 380,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Task Name: ${currentTask.title}" , style: TextStyle(fontSize: 20),),
                    SizedBox(height: 18),
                    Text("Task Description: ${currentTask.description}", style: TextStyle(fontSize: 20),),
                    SizedBox(height: 18),
                    Text("Status: ${currentTask.isCompleted ? "Completed!" : "Pending.."}", style: TextStyle(fontSize: 20),),
                    SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final updatedTask = await Navigator.push<Task>(context, MaterialPageRoute(builder: (context) => TaskEditPage(task: currentTask)));
                          if (updatedTask != null) {
                            setState(() {
                              currentTask = updatedTask;
                            });
                                         
                          }
                        },
                        child: Text("Edit")
                      ),
                    )
                  ],
                ),
              ),       
            ),
          ),
        ),
      );
  }
}