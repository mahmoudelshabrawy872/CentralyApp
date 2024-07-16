import 'package:flutex_admin/core/route/route.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/home/home_controller.dart';
import 'package:flutex_admin/data/controller/project/project_controller.dart';
import 'package:flutex_admin/data/repo/home/home_repo.dart';
import 'package:flutex_admin/data/repo/project/project_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/custom_fab.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/no_data.dart';
import 'package:flutex_admin/view/components/overview_card.dart';
import 'package:flutex_admin/view/screens/project/widget/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ProjectRepo(apiClient: Get.find()));
    final controller = Get.put(ProjectController(projectRepo: Get.find()));
    Get.put(HomeRepo(apiClient: Get.find()));
    final homeController = Get.put(HomeController(homeRepo: Get.find()));
    controller.isLoading = true;
    super.initState();
    handleScroll();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialData();
      homeController.initialData();
    });
  }

  bool showFab = true;
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.removeListener(() {});
    super.dispose();
  }

  void handleScroll() async {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (showFab) setState(() => showFab = false);
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!showFab) setState(() => showFab = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.projects.tr,
      ),
      floatingActionButton: AnimatedSlide(
        offset: showFab ? Offset.zero : const Offset(0, 2),
        duration: const Duration(milliseconds: 300),
        child: AnimatedOpacity(
          opacity: showFab ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: CustomFAB(
              isShowIcon: true,
              isShowText: false,
              press: () {
                Get.toNamed(RouteHelper.addProjectScreen);
              }),
        ),
      ),
      body: GetBuilder<HomeController>(builder: (homeController) {
        return GetBuilder<ProjectController>(
          builder: (controller) {
            return controller.isLoading
                ? const CustomLoader()
                : RefreshIndicator(
                    color: ColorResources.primaryColor,
                    onRefresh: () async {
                      await controller.initialData(shouldLoad: false);
                      await homeController.initialData();
                    },
                    child: Column(
                      children: [
                        ExpansionTile(
                          title: Row(
                            children: [
                              Container(
                                width: Dimensions.space3,
                                height: Dimensions.space15,
                                color: ColorResources.blueColor,
                              ),
                              const SizedBox(width: Dimensions.space5),
                              Text(
                                LocalStrings.projectSummery.tr,
                                style: regularLarge.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color),
                              ),
                            ],
                          ),
                          shape: const Border(),
                          initiallyExpanded: true,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.space15),
                              child: SizedBox(
                                height: 80,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return OverviewCard(
                                          name: homeController.homeModel.data!
                                              .projects![index].status!.tr,
                                          number: homeController.homeModel.data!
                                              .projects![index].total
                                              .toString(),
                                          color: ColorResources.blueColor);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                            width: Dimensions.space5),
                                    itemCount: homeController
                                        .homeModel.data!.projects!.length),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Dimensions.space15),
                          child: Row(
                            children: [
                              Text(
                                LocalStrings.projects.tr,
                                style: regularLarge.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.sort_outlined,
                                      size: Dimensions.space15,
                                      color: ColorResources.blueGreyColor,
                                    ),
                                    Text(
                                      LocalStrings.filter.tr,
                                      style: lightSmall.copyWith(
                                          color: ColorResources.blueGreyColor),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        controller.projectsModel.data!.isNotEmpty
                            ? Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Dimensions.space15),
                                  child: ListView.separated(
                                      controller: scrollController,
                                      itemBuilder: (context, index) {
                                        return ProjectCard(
                                          index: index,
                                          projectModel:
                                              controller.projectsModel,
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                              height: Dimensions.space10),
                                      itemCount: controller
                                          .projectsModel.data!.length),
                                ),
                              )
                            : const NoDataWidget(),
                      ],
                    ),
                  );
          },
        );
      }),
    );
  }
}
