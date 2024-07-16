import 'package:flutex_admin/core/helper/date_converter.dart';
import 'package:flutex_admin/core/route/route.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/model/contract/contract_model.dart';
import 'package:flutex_admin/view/components/divider/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class ContractCard extends StatelessWidget {
  const ContractCard({
    super.key,
    required this.index,
    required this.model,
  });
  final int index;
  final ContractsModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteHelper.contractDetailsScreen,
          arguments: model.data![index].id),
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
                  color: Colors.lightBlue.shade600,
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
                          model.data![index].subject ?? '',
                          style: regularDefault,
                        ),
                        Text(
                          model.data![index].contractValue ?? '',
                          style: regularDefault,
                        ),
                      ],
                    ),
                    const SizedBox(height: Dimensions.space5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.data![index].description ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: lightSmall.copyWith(
                              color: ColorResources.blueGreyColor),
                        ),
                        Text(
                          model.data![index].signed == '0'
                              ? LocalStrings.notSigned.tr
                              : LocalStrings.signed.tr,
                          style: lightSmall.copyWith(
                              color: ColorResources.contractStatusColor(
                                  model.data![index].signed!)),
                        ),
                      ],
                    ),
                    const CustomDivider(space: Dimensions.space10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextIcon(
                          text: model.data![index].company ?? '',
                          prefix: const Icon(
                            Icons.account_box_rounded,
                            color: ColorResources.primaryColor,
                            size: 14,
                          ),
                          edgeInsets: EdgeInsets.zero,
                          textStyle: lightSmall.copyWith(
                              color: ColorResources.blueGreyColor),
                        ),
                        const SizedBox(
                          width: Dimensions.space12,
                        ),
                        TextIcon(
                          text: DateConverter.formatValidityDate(
                              model.data![index].dateAdded ?? ''),
                          prefix: const Icon(
                            Icons.calendar_month,
                            color: ColorResources.primaryColor,
                            size: 14,
                          ),
                          edgeInsets: EdgeInsets.zero,
                          textStyle: lightSmall.copyWith(
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
