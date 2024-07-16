import 'package:flutter/material.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';

class BottomSheetCloseButton extends StatelessWidget {
  const BottomSheetCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(Dimensions.space5),
        decoration: BoxDecoration(
            color:
                Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(.1),
            shape: BoxShape.circle),
        child: Icon(Icons.clear,
            color: Theme.of(context).textTheme.bodyMedium!.color!, size: 15),
      ),
    );
  }
}
