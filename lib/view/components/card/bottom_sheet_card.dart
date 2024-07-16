import 'package:flutter/material.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/util.dart';

class BottomSheetCard extends StatelessWidget {
  final Widget child;
  final double bottomSpace;
  final double padding;
  const BottomSheetCard(
      {super.key,
      required this.child,
      this.bottomSpace = Dimensions.space7,
      this.padding = Dimensions.space15});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.only(top: bottomSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
          color: Theme.of(context).cardColor,
          border: Border.all(
              width: .5, color: Theme.of(context).hintColor.withOpacity(.1)),
          boxShadow: MyUtils.getBottomSheetShadow(),
        ),
        child: child);
  }
}
