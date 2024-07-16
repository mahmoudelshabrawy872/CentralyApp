import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/style.dart';

class AppBarTitle extends StatelessWidget {
  final String text;
  final Color textColor;
  const AppBarTitle(
      {super.key,
      required this.text,
      this.textColor = ColorResources.primaryTextColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style:
          regularLarge.copyWith(color: textColor, fontWeight: FontWeight.w500),
    );
  }
}
