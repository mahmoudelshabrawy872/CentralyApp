import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/style.dart';

class TextFieldPersonValidityWidget extends StatelessWidget {
  final bool? isVisible;
  final String validMsg;
  final String invalidMsg;

  const TextFieldPersonValidityWidget(
      {super.key,
      this.isVisible,
      required this.validMsg,
      required this.invalidMsg});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isVisible != null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isVisible == true
                ? Text(
                    validMsg.tr,
                    style: regularSmall.copyWith(
                        color: ColorResources.colorGreen,
                        fontWeight: FontWeight.w500),
                  )
                : Text(
                    invalidMsg.tr,
                    style: regularSmall.copyWith(
                        color: ColorResources.colorRed,
                        fontWeight: FontWeight.w500),
                  ),
          ],
        ));
  }
}
