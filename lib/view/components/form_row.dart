import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/style.dart';

class FormRow extends StatelessWidget {
  final String label;
  final bool isRequired;

  const FormRow({super.key, required this.label, required this.isRequired});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label.tr,
            style:
                regularDefault.copyWith(color: ColorResources.labelTextColor)),
        Text(isRequired ? ' *' : '',
            style: boldDefault.copyWith(color: Colors.red))
      ],
    );
  }
}
