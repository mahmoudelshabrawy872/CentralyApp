class ContractPostModel {
  final String subject;
  final String client;
  final String startDate;
  final String endDate;
  final String contractValue;
  final String description;
  final String content;

  ContractPostModel({
    required this.subject,
    required this.startDate,
    required this.client,
    required this.endDate,
    required this.contractValue,
    required this.description,
    required this.content,
  });
}
