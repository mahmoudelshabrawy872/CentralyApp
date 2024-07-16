import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.currentValue,
    required this.totalValue,
    required this.percent,
    required this.icon,
    required this.title,
  });

  final int currentValue;
  final int totalValue;
  final String percent;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 140,
        margin: const EdgeInsets.all(Dimensions.space5),
        padding: const EdgeInsets.all(Dimensions.space20),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  backgroundColor: ColorResources.colorLightGrey,
                  value: double.parse(percent) / 100,
                ),
                Icon(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  icon,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: Dimensions.space5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(currentValue.toString(), style: regularOverLarge),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimensions.space5),
                  child: Text(
                    LocalStrings.of.tr,
                    style: regularDefault,
                  ),
                ),
                Text(
                  totalValue.toString(),
                  style: regularDefault.copyWith(
                      color: ColorResources.colorlighterGrey),
                ),
              ],
            ),
            const SizedBox(height: Dimensions.space5),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style:
                  lightSmall.copyWith(color: ColorResources.colorlighterGrey),
            )
          ],
        ),
      ),
    );
  }
}
