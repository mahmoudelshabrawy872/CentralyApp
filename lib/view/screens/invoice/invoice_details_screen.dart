import 'package:flutex_admin/core/helper/string_format_helper.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/invoice/invoice_controller.dart';
import 'package:flutex_admin/data/repo/invoice/invoice_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/no_data.dart';
import 'package:flutex_admin/view/screens/invoice/widget/invoice_datatable.dart';
import 'package:flutex_admin/view/screens/invoice/widget/transactions_datatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(InvoiceRepo(apiClient: Get.find()));
    final controller = Get.put(InvoiceController(invoiceRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadInvoiceDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.invoiceDetails.tr,
      ),
      body: GetBuilder<InvoiceController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  color: ColorResources.primaryColor,
                  onRefresh: () async {
                    await controller.initialData(shouldLoad: false);
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.space10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${controller.invoiceDetailsModel.data!.prefix!}${controller.invoiceDetailsModel.data!.number!}',
                                style: regularDefault,
                              ),
                              Container(
                                  padding:
                                      const EdgeInsets.all(Dimensions.space5),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.cardRadius),
                                      side: BorderSide(
                                          color:
                                              ColorResources.invoiceStatusColor(
                                                  controller.invoiceDetailsModel
                                                          .data!.status ??
                                                      '')),
                                    ),
                                  ),
                                  child: Text(
                                    Converter.invoiceStatusString(controller
                                            .invoiceDetailsModel.data!.status ??
                                        ''),
                                    style: regularSmall.copyWith(
                                        color:
                                            ColorResources.invoiceStatusColor(
                                                controller.invoiceDetailsModel
                                                        .data!.status ??
                                                    '')),
                                  ))
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: Dimensions.space5),
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.space5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${LocalStrings.billTo.tr}: ${controller.invoiceDetailsModel.data!.clientData?.company}',
                                  style: lightDefault,
                                ),
                                const SizedBox(height: Dimensions.space5),
                                Text(
                                  '${LocalStrings.invoiceDate.tr}: ${controller.invoiceDetailsModel.data!.date}',
                                  style: lightDefault,
                                ),
                                const SizedBox(
                                  height: Dimensions.space5,
                                ),
                                Text(
                                  '${LocalStrings.dueDate.tr}: ${controller.invoiceDetailsModel.data!.duedate}',
                                  style: lightDefault,
                                ),
                                const SizedBox(height: Dimensions.space5),
                                Text(
                                  '${LocalStrings.project.tr}: ${controller.invoiceDetailsModel.data!.projectData?.name ?? ''}',
                                  style: lightDefault,
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: ColorResources.blueGreyColor,
                          ),
                          InvoiceDataTable(),
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.space5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      LocalStrings.subtotal.tr,
                                      style: regularDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      LocalStrings.total.tr,
                                      style: regularDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      LocalStrings.totalPaid.tr,
                                      style: regularDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      LocalStrings.amountDue.tr,
                                      style: regularDefault.copyWith(
                                          color: ColorResources.redColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: Dimensions.space15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${controller.invoiceDetailsModel.data!.subtotal} ${controller.invoiceDetailsModel.data!.currencySymbol}',
                                      style: mediumDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      '${controller.invoiceDetailsModel.data!.total} ${controller.invoiceDetailsModel.data!.currencySymbol}',
                                      style: mediumDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      '- ${(double.parse(controller.invoiceDetailsModel.data!.total ?? '') - double.parse(controller.invoiceDetailsModel.data!.totalLeftToPay ?? '')).toStringAsFixed(2)} ${controller.invoiceDetailsModel.data!.currencySymbol}',
                                      style: mediumDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      '${controller.invoiceDetailsModel.data!.totalLeftToPay} ${controller.invoiceDetailsModel.data!.currencySymbol}',
                                      style: mediumDefault.copyWith(
                                        fontWeight: FontWeight.w300,
                                        color: ColorResources.redColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            LocalStrings.transactions.tr,
                            style: regularDefault,
                          ),
                          const Divider(
                            color: ColorResources.blueGreyColor,
                          ),
                          controller.invoiceDetailsModel.data!.payments!
                                  .isNotEmpty
                              ? TransactionsDataTable()
                              : const Center(
                                  child: NoDataWidget(),
                                ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
