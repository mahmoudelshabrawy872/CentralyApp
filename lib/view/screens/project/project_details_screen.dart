import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutex_admin/core/helper/string_format_helper.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/project/project_controller.dart';
import 'package:flutex_admin/data/repo/project/project_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/screens/project/section/discussions.dart';
import 'package:flutex_admin/view/screens/project/section/estimates.dart';
import 'package:flutex_admin/view/screens/project/section/invoices.dart';
import 'package:flutex_admin/view/screens/project/section/overview.dart';
import 'package:flutex_admin/view/screens/project/section/proposals.dart';
import 'package:flutex_admin/view/screens/project/section/tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ProjectRepo(apiClient: Get.find()));
    final controller = Get.put(ProjectController(projectRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadProjectDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.projectDetails.tr,
      ),
      body: GetBuilder<ProjectController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  color: ColorResources.primaryColor,
                  onRefresh: () async {
                    await controller.loadProjectDetails(widget.id);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(Dimensions.space10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.projectDetailsModel.data!.name ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: Dimensions.fontDefault),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      animationDuration:
                                          const Duration(milliseconds: 5000),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      side: BorderSide(
                                          color:
                                              ColorResources.projectStatusColor(
                                                  controller.projectDetailsModel
                                                      .data!.status!)),
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      Converter.projectStatusString(controller
                                              .projectDetailsModel
                                              .data!
                                              .status ??
                                          ''),
                                      style: regularDefault.copyWith(
                                          color:
                                              ColorResources.projectStatusColor(
                                                  controller.projectDetailsModel
                                                      .data!.status!)),
                                    ))
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              endIndent: 150,
                            ),
                            const SizedBox(height: Dimensions.space10),
                            Text(
                              LocalStrings.description.tr,
                              style: mediumDefault,
                            ),
                            const SizedBox(height: Dimensions.space10),
                            Text(
                              controller
                                      .projectDetailsModel.data!.description ??
                                  '',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimensions.space20),
                      Expanded(
                        child: Container(
                          color: Theme.of(context).cardColor,
                          width: double.infinity,
                          child: ContainedTabBarView(
                            tabBarProperties: TabBarProperties(
                                isScrollable: true,
                                unselectedLabelColor:
                                    ColorResources.blueGreyColor,
                                labelColor: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                                indicatorColor: ColorResources.secondaryColor,
                                labelPadding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.space15)),
                            tabs: [
                              Text(
                                LocalStrings.overview.tr,
                                style: regularLarge,
                              ),
                              Text(
                                LocalStrings.tasks.tr,
                                style: regularLarge,
                              ),
                              Text(
                                LocalStrings.invoices.tr,
                                style: regularLarge,
                              ),
                              Text(
                                LocalStrings.estimates.tr,
                                style: regularLarge,
                              ),
                              Text(
                                LocalStrings.discussion.tr,
                                style: regularLarge,
                              ),
                              Text(
                                LocalStrings.proposals.tr,
                                style: regularLarge,
                              ),
                            ],
                            views: const [
                              OverviewWidget(),
                              TasksWidget(),
                              InvoicesWidget(),
                              EstimatesWidget(),
                              DiscussionsWidget(),
                              ProposalsWidget(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
