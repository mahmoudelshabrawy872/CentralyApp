import 'package:flutex_admin/core/helper/string_format_helper.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/estimate/estimate_controller.dart';
import 'package:flutex_admin/data/repo/estimate/estimate_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/screens/estimate/widget/estimate_datatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimateDetailsScreen extends StatefulWidget {
  const EstimateDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<EstimateDetailsScreen> createState() => _EstimateDetailsScreenState();
}

class _EstimateDetailsScreenState extends State<EstimateDetailsScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(EstimateRepo(apiClient: Get.find()));
    final controller = Get.put(EstimateController(estimateRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadEstimateDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.estimateDetails.tr,
      ),
      body: GetBuilder<EstimateController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  color: ColorResources.primaryColor,
                  onRefresh: () async {
                    await controller.loadEstimateDetails(widget.id);
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
                                '${controller.estimateDetailsModel.data!.prefix}${controller.estimateDetailsModel.data!.number}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: Dimensions.fontLarge),
                              ),
                              Container(
                                  padding:
                                      const EdgeInsets.all(Dimensions.space5),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.cardRadius),
                                      side: BorderSide(
                                          color: ColorResources
                                              .estimateStatusColor(controller
                                                  .estimateDetailsModel
                                                  .data!
                                                  .status!)),
                                    ),
                                  ),
                                  child: Text(
                                    Converter.estimateStatusString(controller
                                            .estimateDetailsModel
                                            .data!
                                            .status ??
                                        ''),
                                    style: TextStyle(
                                        color:
                                            ColorResources.estimateStatusColor(
                                                controller.estimateDetailsModel
                                                    .data!.status!)),
                                  ))
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                            endIndent: 150,
                          ),
                          const SizedBox(height: Dimensions.space5),
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.space5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${LocalStrings.to.tr}: ${controller.estimateDetailsModel.data!.clientData!.company}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: Dimensions.space5),
                                Text(
                                  '${LocalStrings.estimateDate.tr}: ${controller.estimateDetailsModel.data!.date!}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  height: Dimensions.space5,
                                ),
                                Text(
                                  '${LocalStrings.expiryDate.tr}: ${controller.estimateDetailsModel.data!.expiryDate!}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  height: Dimensions.space5,
                                ),
                                Text(
                                  '${LocalStrings.referenceNo.tr}: ${controller.estimateDetailsModel.data!.referenceNo}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          EstimateDataTable(),
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
                                      style: const TextStyle(
                                          fontSize: Dimensions.fontSmall,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: Dimensions.space10,
                                    ),
                                    Text(
                                      LocalStrings.total.tr,
                                      style: const TextStyle(
                                          fontSize: Dimensions.fontSmall,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: Dimensions.space10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${controller.estimateDetailsModel.data!.subTotal!} ${controller.estimateDetailsModel.data!.currencySymbol!}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      '${controller.estimateDetailsModel.data!.total!} ${controller.estimateDetailsModel.data!.currencySymbol!}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (controller.estimateDetailsModel.data!.adminNote !=
                              '')
                            Container(
                              margin: const EdgeInsets.all(Dimensions.space5),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cardRadius),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(Dimensions.space15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocalStrings.clientNote.tr,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const Divider(
                                      color: ColorResources.blueGreyColor,
                                      thickness: 0.50,
                                    ),
                                    Text(
                                      controller.estimateDetailsModel.data!
                                          .clientNote!,
                                      style: lightSmall.copyWith(
                                          color: ColorResources.darkColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (controller
                                  .estimateDetailsModel.data!.clientNote !=
                              '')
                            Container(
                              margin: const EdgeInsets.all(Dimensions.space5),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cardRadius),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(Dimensions.space15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocalStrings.clientNote.tr,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const Divider(
                                      color: ColorResources.blueGreyColor,
                                      thickness: 0.50,
                                    ),
                                    Text(
                                      controller.estimateDetailsModel.data!
                                          .clientNote!,
                                      style: lightSmall.copyWith(
                                          color: ColorResources.darkColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (controller.estimateDetailsModel.data!.terms != '')
                            Container(
                              margin: const EdgeInsets.all(Dimensions.space5),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cardRadius),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(Dimensions.space15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocalStrings.terms.tr,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const Divider(
                                      color: ColorResources.blueGreyColor,
                                      thickness: 0.50,
                                    ),
                                    Text(
                                      controller
                                          .estimateDetailsModel.data!.terms!,
                                      style: lightSmall.copyWith(
                                          color: ColorResources.darkColor),
                                    ),
                                  ],
                                ),
                              ),
                            )
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
