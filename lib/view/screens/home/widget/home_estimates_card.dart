import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/model/home/home_response_model.dart';
import 'package:flutex_admin/view/screens/home/widget/custom_linerprogress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeEstimatesCard extends StatelessWidget {
  const HomeEstimatesCard({
    super.key,
    required this.estimates,
  });
  final List<DataField>? estimates;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.space12),
              child: TextIcon(
                text: LocalStrings.estimates.tr,
                prefix: const Icon(
                  Icons.add_chart_outlined,
                  size: 20,
                ),
                spacing: 10,
                edgeInsets: EdgeInsets.zero,
                textStyle: regularExtraLarge,
              ),
            ),
            const SizedBox(height: Dimensions.space5),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimensions.space15),
              child: SizedBox(
                height: 350,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomLinerProgress(
                        name: estimates![index].status?.tr ?? '',
                        color: ColorResources.estimateTextStatusColor(
                            estimates![index].status.toString()),
                        value: estimates![index].percent.toDouble() / 100,
                        data: estimates![index].total.toString(),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: Dimensions.space2),
                    itemCount: estimates!.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
