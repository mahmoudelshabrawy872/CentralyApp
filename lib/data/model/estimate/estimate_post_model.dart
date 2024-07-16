import 'package:flutex_admin/data/model/estimate/estimate_item_model.dart';

class EstimatePostModel {
  final String clientId;
  final String number;
  final String date;
  final String duedate;
  final String currency;
  final String firstItemName;
  final String? firstItemDescription;
  final String firstItemQty;
  final String firstItemRate;
  final String? firstItemUnit;
  final List<EstimateItemsModel> newItems;
  final String subtotal;
  final String total;
  final String billingStreet;
  final String? billingCity;
  final String? billingState;
  final String? billingZip;
  final String? billingCountry;
  final String? shippingStreet;
  final String? shippingCity;
  final String? shippingState;
  final String? shippingZip;
  final String? shippingCountry;
  final String? tags;
  final String? status;
  final String? reference;
  final String? saleAgent;
  final String? adminNote;
  final String? clientNote;
  final String? terms;

  EstimatePostModel({
    required this.clientId,
    required this.number,
    required this.date,
    required this.duedate,
    required this.currency,
    required this.firstItemName,
    this.firstItemDescription,
    required this.firstItemQty,
    required this.firstItemRate,
    this.firstItemUnit,
    required this.newItems,
    required this.subtotal,
    required this.total,
    required this.billingStreet,
    this.billingCity,
    this.billingState,
    this.billingZip,
    this.billingCountry,
    this.shippingStreet,
    this.shippingCity,
    this.shippingState,
    this.shippingZip,
    this.shippingCountry,
    this.tags,
    this.status,
    this.reference,
    this.saleAgent,
    this.adminNote,
    this.clientNote,
    this.terms,
  });
}
