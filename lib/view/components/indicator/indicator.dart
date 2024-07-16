import 'package:flutter/material.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/util.dart';

class LoadingIndicator extends StatelessWidget {
  final double strokeWidth;
  const LoadingIndicator({super.key, this.strokeWidth = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorResources.colorWhite,
          boxShadow: MyUtils.getCardShadow(context)),
      child: const CircularProgressIndicator(
        color: ColorResources.primaryColor,
        strokeWidth: 3,
      ),
    );
  }
}
