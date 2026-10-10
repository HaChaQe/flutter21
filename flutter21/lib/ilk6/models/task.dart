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
