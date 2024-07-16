import 'dart:ffi';

import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.name,
      required this.number,
      required this.color,
      this.icon,
      this.iconSize});
  final String name;
  final String number;
  final Color color;
  final IconData? icon;
  final Double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: Dimensions.space80,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimensions.cardRadius),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimensions.space5),
              child: Row(
                mainAxisAlignment: icon != null
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  icon != null
                      ? Icon(icon, size: 20, color: color)
                      : const SizedBox.shrink(),
                  Text(
                    number,
                    style: mediumExtraLarge.copyWith(color: color),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimensions.space5),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: regularSmall.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium!.color),
            ),
          ],
        ),
      ),
    );
  }
}
