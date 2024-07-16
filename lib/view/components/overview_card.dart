import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard(
      {super.key,
      required this.name,
      required this.number,
      required this.color});
  final String name;
  final String number;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.space60,
      width: Dimensions.space100,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: mediumExtraLarge.copyWith(color: color),
          ),
          const SizedBox(
            height: Dimensions.space5,
          ),
          Text(
            name,
            style: regularSmall.copyWith(
                color: Theme.of(context).textTheme.bodyMedium!.color),
          ),
        ],
      ),
    );
  }
}
