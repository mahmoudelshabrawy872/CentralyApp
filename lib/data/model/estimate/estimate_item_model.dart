import 'package:flutter/material.dart';

class EstimateItemsModel {
  final TextEditingController itemNameController;
  final TextEditingController descriptionController;
  final TextEditingController qtyController;
  final TextEditingController unitController;
  final TextEditingController rateController;

  const EstimateItemsModel({
    required this.itemNameController,
    required this.descriptionController,
    required this.qtyController,
    required this.unitController,
    required this.rateController,
  });
}
