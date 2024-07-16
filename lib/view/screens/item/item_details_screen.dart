import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/item/item_controller.dart';
import 'package:flutex_admin/data/repo/item/item_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/divider/custom_divider.dart';
import 'package:flutex_admin/view/components/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ItemRepo(apiClient: Get.find()));
    final controller = Get.put(ItemController(itemRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadItemDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.itemDetails.tr,
      ),
      body: GetBuilder<ItemController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  onRefresh: () async {
                    await controller.loadItemDetails(widget.id);
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
                                text:
                                    '${controller.itemDetailsModel.data!.description}',
                                textStyle: mediumExtraLarge,
                              ),
                              Text(
                                '${controller.itemDetailsModel.data!.groupName}',
                                style: lightDefault.copyWith(
                                    color: ColorResources.primaryColor),
                              )
                            ],
                          ),
                          const CustomDivider(space: Dimensions.space10),
                          Text(
                            '${LocalStrings.description.tr}:',
                            style: lightDefault,
                          ),
                          const SizedBox(height: Dimensions.space5),
                          Text(
                            '${controller.itemDetailsModel.data!.longDescription}',
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
                                    LocalStrings.rate.tr,
                                    style: lightLarge.copyWith(
                                        color: ColorResources.colorWhite),
                                  ),
                                  const SizedBox(height: Dimensions.space5),
                                  Text(
                                    '${controller.itemDetailsModel.data!.rate} / ${controller.itemDetailsModel.data!.unit}',
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
