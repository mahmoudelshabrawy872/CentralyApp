import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/lead/lead_controller.dart';
import 'package:flutex_admin/data/repo/lead/lead_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/screens/lead/widget/lead_attachment.dart';
import 'package:flutex_admin/view/screens/lead/widget/lead_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadDetailsScreen extends StatefulWidget {
  const LeadDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<LeadDetailsScreen> createState() => _LeadDetailsScreenState();
}

class _LeadDetailsScreenState extends State<LeadDetailsScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(LeadRepo(apiClient: Get.find()));
    final controller = Get.put(LeadController(leadRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadLeadDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.leadDetails.tr,
      ),
      body: GetBuilder<LeadController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  onRefresh: () async {
                    await controller.loadLeadDetails(widget.id);
                  },
                  child: ContainedTabBarView(
                    tabBarProperties: TabBarProperties(
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: ColorResources.blueGreyColor,
                        labelColor:
                            Theme.of(context).textTheme.bodyLarge!.color,
                        labelStyle: regularDefault,
                        indicatorColor: ColorResources.secondaryColor,
                        labelPadding: const EdgeInsets.symmetric(
                            vertical: Dimensions.space15)),
                    tabs: [
                      Text(
                        LocalStrings.profile.tr,
                      ),
                      Text(
                        LocalStrings.attachments.tr,
                      ),
                    ],
                    views: [
                      LeadProfile(
                        leadModel: controller.leadDetailsModel.data!,
                      ),
                      LeadAttachment(
                        leadModel: controller.leadDetailsModel.data!,
                      ),
                    ],
                  ));
        },
      ),
    );
  }
}
