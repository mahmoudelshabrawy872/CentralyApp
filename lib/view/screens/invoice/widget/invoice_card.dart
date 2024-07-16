import 'package:flutex_admin/core/helper/string_format_helper.dart';
import 'package:flutex_admin/core/route/route.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/model/invoice/invoice_model.dart';
import 'package:flutex_admin/view/components/divider/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({
    super.key,
    required this.index,
    required this.invoiceModel,
  });
  final int index;
  final InvoicesModel invoiceModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.invoiceDetailsScreen,
            arguments: invoiceModel.data![index].id!);
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
                  color: ColorResources.invoiceStatusColor(
                      invoiceModel.data![index].status ?? ''),
                ),
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(Dimensions.space15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${invoiceModel.data![index].prefix!}${invoiceModel.data![index].number}',
                          style: regularLarge,
                        ),
                        Text(
                          '${invoiceModel.data![index].total} ${invoiceModel.data![index].currencySymbol}',
                          style: regularLarge,
                        ),
                      ],
                    ),
                    const CustomDivider(space: Dimensions.space10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextIcon(
                          text: Converter.invoiceStatusString(
                              invoiceModel.data![index].status ?? ''),
                          prefix: const Icon(
                            Icons.check_circle_outline_rounded,
                            color: ColorResources.secondaryColor,
                            size: 14,
                          ),
                          edgeInsets: EdgeInsets.zero,
                          textStyle: lightDefault.copyWith(
                              color: ColorResources.blueGreyColor),
                        ),
                        const SizedBox(width: Dimensions.space10),
                        TextIcon(
                          text: invoiceModel.data![index].date ?? '',
                          prefix: const Icon(
                            Icons.calendar_month,
                            color: ColorResources.secondaryColor,
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
