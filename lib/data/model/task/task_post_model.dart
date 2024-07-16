class TaskPostModel {
  final String name;
  final String priority;
  final String startDate;
  final String dueDate;
  final String description;
  final String assignees;

  TaskPostModel({
    required this.name,
    required this.priority,
    required this.startDate,
    required this.dueDate,
    required this.description,
    required this.assignees,
  });
}
