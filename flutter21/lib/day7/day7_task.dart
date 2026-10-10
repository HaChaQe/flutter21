class Task {
  final int id;
  String title;
  String description;
  bool isCompleted;
  int priority;

  Task({
    required this.id,
    required this.title,
    this.description = "",
    this.isCompleted = false,
    this.priority = 1
  });
}


void main () {

  List<Task> tasks = [
    Task(id: 1, title: "Learn Flutter", priority: 3),
    Task(id: 2, title: "Go to gym", priority: 2, isCompleted: true),
    Task(id: 3, title: "Learn Firebase", priority: 3),
    Task(id: 4, title: "Play guitar", isCompleted: true, priority: 1),
    Task(id: 5, title: "Update GitHub", priority: 2),
  ];

  final completed = tasks.where((task) => !task.isCompleted).map((task) => task.title);

  final priorityThree = tasks.where((task) => task.priority == 3).toList().map((task) => task.title);

  final List<String> titles = tasks.map((task) => task.title).toList(); // burda neden direkt List<String> yapamadık?

  final priorityFour = tasks.firstWhere((task) => task.id == 4);

  final sort = tasks.sort((a,b) => a.priority.compareTo(b.priority));

  print(completed);
  print(priorityThree);
  print(titles);
  print(priorityFour.title);
  print(tasks.map((task) => task.title));
}