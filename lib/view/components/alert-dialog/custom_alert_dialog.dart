import 'package:flutter/material.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';

class CustomAlertDialog {
  bool isHorizontalPadding;
  final Widget child;

  CustomAlertDialog({this.isHorizontalPadding = false, required this.child});

  void customAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              insetPadding:
                  const EdgeInsets.symmetric(horizontal: Dimensions.space40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  padding: isHorizontalPadding
                      ? const EdgeInsets.symmetric(
                          horizontal: Dimensions.space15,
                          vertical: Dimensions.space12)
                      : const EdgeInsets.symmetric(
                          vertical: Dimensions.space15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorResources.colorWhite,
                      borderRadius: BorderRadius.circular(5)),
                  child: child,
                ),
              ),
            ));
  }
}
