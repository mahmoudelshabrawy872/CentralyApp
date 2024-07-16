import 'package:flutter/material.dart';

class ProposalItemModel {
  final TextEditingController itemNameController;
  final TextEditingController descriptionController;
  final TextEditingController qtyController;
  final TextEditingController unitController;
  final TextEditingController rateController;

  const ProposalItemModel({
    required this.itemNameController,
    required this.descriptionController,
    required this.qtyController,
    required this.unitController,
    required this.rateController,
  });
}
