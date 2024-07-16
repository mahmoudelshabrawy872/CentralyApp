import 'package:flutex_admin/core/utils/images.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/home/home_controller.dart';
import 'package:flutex_admin/data/repo/home/home_repo.dart';
import 'package:flutex_admin/view/components/circle_image_button.dart';
import 'package:flutex_admin/view/components/column_widget/card_column.dart';
import 'package:flutex_admin/view/components/divider/custom_divider.dart';
import 'package:flutex_admin/view/components/image/circle_shape_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(HomeRepo(apiClient: Get.find()));
    final controller = Get.put(HomeController(homeRepo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CustomAppBar(
            title: LocalStrings.profile.tr,
            bgColor: Theme.of(context).appBarTheme.backgroundColor!,
          ),
          body: controller.isLoading
              ? const CustomLoader()
              : Stack(
                  children: [
                    Positioned(
                      top: -10,
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).appBarTheme.backgroundColor!,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                            left: Dimensions.space15,
                            right: Dimensions.space15,
                            top: Dimensions.space20,
                            bottom: Dimensions.space20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: Dimensions.space15,
                              horizontal: Dimensions.space30),
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                        border: Border.all(
                                            width: .3,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    child: CircleImageWidget(
                                      isProfile: true,
                                      imagePath: controller
                                              .homeModel.staff?.profileImage ??
                                          '',
                                      height: 90,
                                      width: 90,
                                      isAsset: false,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    '${controller.homeModel.staff?.firstName ?? ''} ${controller.homeModel.staff?.lastName ?? ''}',
                                    style: regularExtraLarge.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color),
                                  )
                                ],
                              ),
                              const SizedBox(height: Dimensions.space20),
                              Row(
                                children: [
                                  CircleShapeImage(
                                      imageColor: Theme.of(context)
                                          .appBarTheme
                                          .backgroundColor,
                                      image: MyImages.email),
                                  const SizedBox(width: Dimensions.space15),
                                  CardColumn(
                                      header: LocalStrings.email.tr,
                                      body: controller.homeModel.staff?.email ??
                                          '')
                                ],
                              ),
                              const CustomDivider(space: Dimensions.space15),
                              Row(
                                children: [
                                  CircleShapeImage(
                                      imageColor: Theme.of(context)
                                          .appBarTheme
                                          .backgroundColor,
                                      image: MyImages.phone),
                                  const SizedBox(width: Dimensions.space15),
                                  CardColumn(
                                      header: LocalStrings.phone.tr,
                                      body: controller
                                              .homeModel.staff?.phoneNumber ??
                                          '')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
