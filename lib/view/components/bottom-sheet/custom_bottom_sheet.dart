import 'package:flutter/material.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';

class CustomBottomSheet {
  final Widget child;
  bool isNeedMargin;
  final VoidCallback? voidCallback;
  CustomBottomSheet(
      {required this.child, this.isNeedMargin = false, this.voidCallback});

  void customBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: ColorResources.transparentColor,
        context: context,
        builder: (BuildContext context) => SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: AnimatedPadding(
                padding: MediaQuery.of(context).viewInsets,
                duration: const Duration(milliseconds: 50),
                curve: Curves.decelerate,
                child: Container(
                  margin: isNeedMargin
                      ? const EdgeInsets.only(left: 15, right: 15, bottom: 15)
                      : null,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.space15,
                      vertical: Dimensions.space12),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: isNeedMargin
                          ? BorderRadius.circular(15)
                          : const BorderRadius.vertical(
                              top: Radius.circular(15))),
                  child: child,
                ),
              ),
            )).then((value) => voidCallback);
  }
}
