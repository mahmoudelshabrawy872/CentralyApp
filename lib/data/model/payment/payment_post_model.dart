class PaymentPostModel {
  final String subject;
  final String related;
  final int relId;
  final String proposalTo;
  final String date;
  final String openTill;
  final String currency;
  final String discountType;
  final String status;
  final String assigned;
  final String email;
  final String newItems; // Array

  PaymentPostModel({
    required this.subject,
    required this.related,
    required this.relId,
    required this.proposalTo,
    required this.date,
    required this.openTill,
    required this.currency,
    required this.discountType,
    required this.status,
    required this.assigned,
    required this.email,
    required this.newItems,
  });
}
