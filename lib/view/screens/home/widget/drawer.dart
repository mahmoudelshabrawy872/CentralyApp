import 'package:flutex_admin/core/route/route.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/data/controller/home/home_controller.dart';
import 'package:flutex_admin/data/repo/home/home_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/circle_image_button.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/dialog/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/style.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
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
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => SafeArea(
              child: Drawer(
                child: Column(
                  children: [
                    DrawerHeader(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorResources.blueGreyColor,
                            radius: 42,
                            child: CircleImageWidget(
                              imagePath:
                                  controller.homeModel.staff?.profileImage ??
                                      '',
                              isAsset: false,
                              isProfile: true,
                              width: 80,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            width: Dimensions.space20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.homeModel.staff?.firstName ?? ''} ${controller.homeModel.staff?.lastName ?? ''}',
                                style: semiBoldLarge.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Get.toNamed(RouteHelper.profileScreen);
                                  },
                                  child: Text(
                                    LocalStrings.viewProfile.tr,
                                    style: semiBoldLarge.copyWith(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        decoration: TextDecoration.underline),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    controller.isLoading
                        ? const CustomLoader()
                        : SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                controller.homeModel.menuItems?.customers ??
                                        false
                                    ? ListTile(
                                        leading: Icon(
                                          Icons.group_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                        ),
                                        title: Text(
                                          LocalStrings.customers.tr,
                                          style: regularDefault.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: Dimensions.space12,
                                          color:
                                              ColorResources.contentTextColor,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Get.toNamed(
                                              RouteHelper.customerScreen);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                controller.homeModel.menuItems?.projects ??
                                        false
                                    ? ListTile(
                                        leading: Icon(
                                          Icons.task_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                        ),
                                        title: Text(
                                          LocalStrings.projects.tr,
                                          style: regularDefault.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: Dimensions.space12,
                                          color:
                                              ColorResources.contentTextColor,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Get.toNamed(
                                              RouteHelper.projectScreen);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                controller.homeModel.menuItems?.invoices ??
                                        false
                                    ? ListTile(
                                        leading: Icon(
                                          Icons.assignment_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                        ),
                                        title: Text(
                                          LocalStrings.invoices.tr,
                                          style: regularDefault.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: Dimensions.space12,
                                          color:
                                              ColorResources.contentTextColor,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Get.toNamed(
                                              RouteHelper.invoiceScreen);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                controller.homeModel.menuItems?.contracts ??
                                        false
                                    ? ListTile(
                                        leading: Icon(
                                          Icons.article_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                        ),
                                        title: Text(
                                          LocalStrings.contracts.tr,
                                          style: regularDefault.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: Dimensions.space12,
                                          color:
                                              ColorResources.contentTextColor,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Get.toNamed(
                                              RouteHelper.contractScreen);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                controller.homeModel.menuItems?.tickets ?? false
                                    ? ListTile(
                                        leading: Icon(
                                          Icons.confirmation_number_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                        ),
                                        title: Text(
                                          LocalStrings.tickets.tr,
                                          style: regularDefault.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: Dimensions.space12,
                                          color:
                                              ColorResources.contentTextColor,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Get.toNamed(RouteHelper.ticketScreen);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                controller.homeModel.menuItems?.leads ?? false
                                    ? ListTile(
                                        leading: Icon(
                                          Icons.markunread_mailbox_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                        ),
                                        title: Text(
                                          LocalStrings.leads.tr,
                                          style: regularDefault.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: Dimensions.space12,
                                          color:
                                              ColorResources.contentTextColor,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Get.toNamed(RouteHelper.leadScreen);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                controller.homeModel.menuItems?.estimates ??
                                        false
                                    ? ListTile(
                                        leading: Icon(
                                          Icons.add_chart_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                        ),
                                        title: Text(
                                          LocalStrings.estimates.tr,
                                          style: regularDefault.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: Dimensions.space12,
                                          color:
                                              ColorResources.contentTextColor,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Get.toNamed(
                                              RouteHelper.estimateScreen);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                controller.homeModel.menuItems?.proposals ??
                                        false
                                    ? ListTile(
                                        leading: Icon(
                                          Icons.document_scanner_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                        ),
                                        title: Text(
                                          LocalStrings.proposals.tr,
                                          style: regularDefault.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: Dimensions.space12,
                                          color:
                                              ColorResources.contentTextColor,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Get.toNamed(
                                              RouteHelper.proposalScreen);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                controller.homeModel.menuItems?.payments ??
                                        false
                                    ? ListTile(
                                        leading: Icon(
                                          Icons.account_balance_wallet_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                        ),
                                        title: Text(
                                          LocalStrings.payments.tr,
                                          style: regularDefault.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: Dimensions.space12,
                                          color:
                                              ColorResources.contentTextColor,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Get.toNamed(
                                              RouteHelper.paymentScreen);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                controller.homeModel.menuItems?.items ?? false
                                    ? ListTile(
                                        leading: Icon(
                                          Icons.add_box_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                        ),
                                        title: Text(
                                          LocalStrings.items.tr,
                                          style: regularDefault.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: Dimensions.space12,
                                          color:
                                              ColorResources.contentTextColor,
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Get.toNamed(RouteHelper.itemScreen);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                ListTile(
                                  leading: Icon(
                                    Icons.account_circle_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,
                                  ),
                                  title: Text(
                                    LocalStrings.settings.tr,
                                    style: regularDefault.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: Dimensions.space12,
                                    color: ColorResources.contentTextColor,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Get.toNamed(RouteHelper.settingsScreen);
                                  },
                                ),
                              ],
                            ),
                          ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListTile(
                          leading: const Icon(
                            Icons.logout,
                            size: Dimensions.space20,
                            color: Colors.red,
                          ),
                          title: Text(
                            LocalStrings.logout.tr,
                            style: regularDefault.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color),
                          ),
                          onTap: () {
                            const WarningAlertDialog().warningAlertDialog(
                              context,
                              () {
                                Get.back();
                                controller.logout();
                              },
                              title: LocalStrings.logout.tr,
                              subTitle: LocalStrings.logoutSureWarningMSg.tr,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
