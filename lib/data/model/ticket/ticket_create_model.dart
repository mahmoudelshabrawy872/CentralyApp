class TicketCreateModel {
  final String subject;
  final String department;
  final String userId;
  final String contactId;
  final String? priority;
  final String? service;
  final String? description;

  TicketCreateModel({
    required this.subject,
    required this.department,
    required this.userId,
    required this.contactId,
    this.priority,
    this.service,
    this.description,
  });
}
