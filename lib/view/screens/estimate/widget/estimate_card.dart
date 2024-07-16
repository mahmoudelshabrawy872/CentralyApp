import 'package:flutex_admin/core/helper/string_format_helper.dart';
import 'package:flutex_admin/core/route/route.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/model/estimate/estimate_model.dart';
import 'package:flutex_admin/view/components/divider/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class EstimateCard extends StatelessWidget {
  const EstimateCard({
    super.key,
    required this.index,
    required this.estimateModel,
  });
  final int index;
  final EstimatesModel estimateModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.estimateDetailsScreen,
            arguments: estimateModel.data![index].id!);
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border(
                left: BorderSide(
                  width: 5.0,
                  color: ColorResources.estimateStatusColor(
                      estimateModel.data![index].status ?? ''),
                ),
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${estimateModel.data![index].prefix!}${estimateModel.data![index].number}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          '${estimateModel.data![index].total} ${estimateModel.data![index].currency}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const CustomDivider(space: Dimensions.space10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextIcon(
                          text: Converter.estimateStatusString(
                              estimateModel.data![index].status ?? '1'),
                          prefix: const Icon(
                            Icons.check_circle_outline_rounded,
                            color: ColorResources.primaryColor,
                            size: 14,
                          ),
                          edgeInsets: EdgeInsets.zero,
                          textStyle: lightDefault.copyWith(
                              color: ColorResources.blueGreyColor),
                        ),
                        const SizedBox(width: Dimensions.space10),
                        TextIcon(
                          text: estimateModel.data![index].expiryDate,
                          prefix: const Icon(
                            Icons.calendar_month,
                            color: ColorResources.primaryColor,
                            size: 14,
                          ),
                          edgeInsets: EdgeInsets.zero,
                          textStyle: lightDefault.copyWith(
                              color: ColorResources.blueGreyColor),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
