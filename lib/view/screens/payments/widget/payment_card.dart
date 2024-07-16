import 'package:flutex_admin/core/route/route.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/model/payment/payment_model.dart';
import 'package:flutex_admin/view/components/divider/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.index,
    required this.paymentModel,
  });
  final int index;
  final PaymentsModel paymentModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.paymentDetailsScreen,
            arguments: paymentModel.data![index].paymentId!);
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: const Border(
                left: BorderSide(
                  width: 5.0,
                  color: ColorResources.blueColor,
                ),
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2,
                          child: Text(
                            '${LocalStrings.payment.tr} #${paymentModel.data![index].paymentId}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              paymentModel.data![index].amount ?? '',
                              style: regularDefault,
                            ),
                            Text(
                              paymentModel.data![index].active == '0'
                                  ? LocalStrings.notActive.tr
                                  : LocalStrings.active.tr,
                              style: lightSmall.copyWith(
                                  color: paymentModel.data![index].active == '0'
                                      ? ColorResources.blueColor
                                      : ColorResources.greenColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const CustomDivider(space: Dimensions.space10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextIcon(
                          text:
                              '${LocalStrings.invoice.tr} #${paymentModel.data![index].invoiceId}',
                          prefix: const Icon(
                            Icons.assignment_outlined,
                            color: ColorResources.primaryColor,
                            size: 14,
                          ),
                          edgeInsets: EdgeInsets.zero,
                          textStyle: lightDefault.copyWith(
                              color: ColorResources.blueGreyColor),
                        ),
                        const SizedBox(width: Dimensions.space10),
                        TextIcon(
                          text: paymentModel.data![index].date,
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
