import 'package:flutex_admin/core/utils/images.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/view/components/buttons/rounded_button.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

showExitDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: ColorResources.getCardBgColor(),
      insetPadding: const EdgeInsets.symmetric(horizontal: Dimensions.space40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: Dimensions.space40,
                  bottom: Dimensions.space15,
                  left: Dimensions.space15,
                  right: Dimensions.space15),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: ColorResources.getCardBgColor(),
                  borderRadius:
                      BorderRadius.circular(Dimensions.defaultRadius)),
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.space10),
                  Text(
                    LocalStrings.exitTitle.tr,
                    style: regularSmall.copyWith(
                        color: ColorResources.getTextColor(),
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontDefault + 3),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  const SizedBox(height: Dimensions.space20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RoundedButton(
                          text: LocalStrings.no.tr,
                          press: () {
                            Navigator.pop(context);
                          },
                          horizontalPadding: 3,
                          verticalPadding: 3,
                          color: ColorResources.colorLightGrey,
                          textColor: ColorResources.colorWhite,
                        ),
                      ),
                      const SizedBox(width: Dimensions.space10),
                      Expanded(
                        child: RoundedButton(
                            text: LocalStrings.yes.tr,
                            press: () {
                              SystemNavigator.pop();
                            },
                            horizontalPadding: 3,
                            verticalPadding: 3,
                            color: ColorResources.getPrimaryColor(),
                            textColor: ColorResources.colorWhite),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: -40,
              left: MediaQuery.of(context).padding.left,
              right: MediaQuery.of(context).padding.right,
              child: Image.asset(
                MyImages.warningImage,
                height: 80,
                width: 80,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
