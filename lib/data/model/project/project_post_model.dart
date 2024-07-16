class ProjectPostModel {
  final String name;
  final String relType;
  final String clientId;
  final String billingType;
  final String startDate;
  final String status;
  final String progressFromTasks;
  final String projectCost;
  final String progress;
  final String projectRatePerHour;
  final String estimatedHours;
  final String projectMembers;
  final String deadline;
  final String tags;
  final String description;

  ProjectPostModel({
    required this.name,
    required this.relType,
    required this.clientId,
    required this.billingType,
    required this.startDate,
    required this.status,
    required this.progressFromTasks,
    required this.projectCost,
    required this.progress,
    required this.projectRatePerHour,
    required this.estimatedHours,
    required this.projectMembers,
    required this.deadline,
    required this.tags,
    required this.description,
  });
}
