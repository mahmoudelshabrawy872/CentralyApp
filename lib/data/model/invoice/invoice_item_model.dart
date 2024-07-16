import 'package:flutter/material.dart';

class InvoiceItemModel {
  final TextEditingController itemNameController;
  final TextEditingController descriptionController;
  final TextEditingController qtyController;
  final TextEditingController unitController;
  final TextEditingController rateController;

  const InvoiceItemModel({
    required this.itemNameController,
    required this.descriptionController,
    required this.qtyController,
    required this.unitController,
    required this.rateController,
  });
}
