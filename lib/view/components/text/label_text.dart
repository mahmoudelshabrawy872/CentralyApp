import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/style.dart';

class LabelText extends StatelessWidget {
  final bool isRequired;
  final String text;
  final TextAlign? textAlign;

  const LabelText({
    super.key,
    required this.text,
    this.textAlign,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return isRequired
        ? Row(
            children: [
              Text(
                text.tr,
                textAlign: textAlign,
                style: regularDefault.copyWith(
                    color: Theme.of(context).textTheme.bodyMedium!.color),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '*',
                style: semiBoldDefault.copyWith(color: ColorResources.colorRed),
              )
            ],
          )
        : Text(
            text.tr,
            textAlign: textAlign,
            style: regularDefault.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: Dimensions.fontSmall),
          );
  }
}
