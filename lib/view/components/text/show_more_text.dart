import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/style.dart';

class ShowMoreText extends StatelessWidget {
  final String text;
  final Callback onTap;
  const ShowMoreText({super.key, required this.onTap, this.text = 'Show More'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text.tr,
        style: semiBoldDefault.copyWith(
            color: ColorResources.getPrimaryColor(),
            decoration: TextDecoration.underline),
      ),
    );
  }
}
