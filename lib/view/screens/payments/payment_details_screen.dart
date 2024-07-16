import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/payment/payment_controller.dart';
import 'package:flutex_admin/data/repo/payment/payment_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/divider/custom_divider.dart';
import 'package:flutex_admin/view/components/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(PaymentRepo(apiClient: Get.find()));
    final controller = Get.put(PaymentController(paymentRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadPaymentDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.paymentDetails.tr,
      ),
      body: GetBuilder<PaymentController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  onRefresh: () async {
                    await controller.loadPaymentDetails(widget.id);
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Container(
                      margin: const EdgeInsets.all(Dimensions.space10),
                      padding: const EdgeInsets.all(Dimensions.space15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.cardRadius),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.05),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeaderText(
                                text: LocalStrings.paymentReceipt.tr,
                                textStyle: mediumExtraLarge,
                              ),
                              Container(
                                  padding:
                                      const EdgeInsets.all(Dimensions.space5),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.cardRadius),
                                      side: BorderSide(
                                          color: controller.paymentDetailsModel
                                                      .data!.active ==
                                                  '0'
                                              ? ColorResources.blueColor
                                              : ColorResources.greenColor),
                                    ),
                                  ),
                                  child: Text(
                                    controller.paymentDetailsModel.data!
                                                .active ==
                                            '0'
                                        ? LocalStrings.notActive.tr
                                        : LocalStrings.active.tr,
                                    style: lightSmall.copyWith(
                                        color: controller.paymentDetailsModel
                                                    .data!.active ==
                                                '0'
                                            ? ColorResources.blueColor
                                            : ColorResources.greenColor),
                                  ))
                            ],
                          ),
                          const CustomDivider(space: Dimensions.space10),
                          Text(
                            '${LocalStrings.paymentMode.tr}:',
                            style: lightDefault,
                          ),
                          const SizedBox(height: Dimensions.space5),
                          Text(
                            '${controller.paymentDetailsModel.data!.name}',
                            style: regularDefault,
                          ),
                          const SizedBox(height: Dimensions.space5),
                          Text(
                            '${LocalStrings.paymentDate.tr}:',
                            style: lightDefault,
                          ),
                          const SizedBox(height: Dimensions.space5),
                          Text(
                            '${controller.paymentDetailsModel.data!.date}',
                            style: regularDefault,
                          ),
                          const SizedBox(height: Dimensions.space5),
                          Text(
                            '${LocalStrings.invoice.tr}:',
                            style: lightDefault,
                          ),
                          const SizedBox(height: Dimensions.space5),
                          Text(
                            '#${controller.paymentDetailsModel.data!.invoiceId}',
                            style: regularDefault,
                          ),
                          const SizedBox(height: Dimensions.space5),
                          Text(
                            '${LocalStrings.transactionId.tr}:',
                            style: lightDefault,
                          ),
                          const SizedBox(height: Dimensions.space5),
                          Text(
                            '${controller.paymentDetailsModel.data!.transactionId}',
                            style: regularDefault,
                          ),
                          const SizedBox(height: Dimensions.space20),
                          Center(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 1.50,
                              height: Dimensions.space90,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.groupCardRadius),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    LocalStrings.totalAmount.tr,
                                    style: lightLarge.copyWith(
                                        color: ColorResources.colorWhite),
                                  ),
                                  const SizedBox(height: Dimensions.space5),
                                  Text(
                                    '${controller.paymentDetailsModel.data!.amount}',
                                    style: regularExtraLarge.copyWith(
                                        color: ColorResources.colorWhite),
                                  ),
                                ],
                              ),
                            ),
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
