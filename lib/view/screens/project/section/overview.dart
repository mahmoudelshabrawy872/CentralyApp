import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/project/project_controller.dart';
import 'package:flutex_admin/view/components/divider/custom_divider.dart';
import 'package:flutex_admin/view/screens/home/widget/custom_container.dart';
import 'package:flutex_admin/view/screens/home/widget/custom_linerprogress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectController>(
      builder: (controller) {
        int daysLeft = int.parse(
            DateTime.parse(controller.projectDetailsModel.data!.deadline!)
                .difference(DateTime.now())
                .inDays
                .toString());
        return Container(
          padding: const EdgeInsets.all(Dimensions.space10),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(Dimensions.space10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimensions.cardRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.circle,
                                color: ColorResources.blueGreyColor, size: 10),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              '${LocalStrings.project.tr}:',
                              style: lightSmall,
                            ),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              '#${controller.projectDetailsModel.data!.id}',
                              style: mediumSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: Dimensions.space5),
                        Row(
                          children: [
                            const Icon(Icons.circle,
                                color: ColorResources.blueGreyColor, size: 10),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              '${LocalStrings.billingType.tr}:',
                              style: lightSmall,
                            ),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              controller.projectDetailsModel.data!
                                          .billingType ==
                                      '1'
                                  ? LocalStrings.fixedRate.tr
                                  : controller.projectDetailsModel.data!
                                              .billingType ==
                                          '2'
                                      ? LocalStrings.projectHours.tr
                                      : LocalStrings.taskHours.tr,
                              style: mediumSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: Dimensions.space5),
                        Row(
                          children: [
                            const Icon(Icons.circle,
                                color: ColorResources.blueGreyColor, size: 10),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              '${LocalStrings.totalRate.tr}:',
                              style: lightSmall,
                            ),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              controller.projectDetailsModel.data!
                                          .billingType ==
                                      '1'
                                  ? controller
                                      .projectDetailsModel.data!.projectCost!
                                  : controller.projectDetailsModel.data!
                                              .billingType ==
                                          '2'
                                      ? '${controller.projectDetailsModel.data!.projectRatePerHour} / ${LocalStrings.hours.tr}'
                                      : controller.projectDetailsModel.data!
                                              .projectCost ??
                                          '',
                              style: mediumSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.circle,
                                color: ColorResources.blueGreyColor, size: 10),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              '${LocalStrings.startDate.tr}:',
                              style: lightSmall,
                            ),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              controller.projectDetailsModel.data!.startDate ??
                                  '',
                              style: mediumSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: Dimensions.space5),
                        Row(
                          children: [
                            const Icon(Icons.circle,
                                color: ColorResources.blueGreyColor,
                                size: Dimensions.space10),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              '${LocalStrings.deadline.tr}:',
                              style: lightSmall,
                            ),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              controller.projectDetailsModel.data!.deadline ??
                                  '',
                              style: mediumSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: Dimensions.space5),
                        Row(
                          children: [
                            const Icon(Icons.circle,
                                color: ColorResources.blueGreyColor, size: 10),
                            const SizedBox(width: Dimensions.space5),
                            Text(
                              '${LocalStrings.logged.tr}:',
                              style: lightSmall,
                            ),
                            const SizedBox(
                              width: Dimensions.space5,
                            ),
                            Text(
                              '00:00',
                              style: mediumSmall.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const CustomDivider(space: Dimensions.space15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(
                      name: LocalStrings.totalExpenses.tr,
                      //TODO: get the right value
                      number: '0.00',
                      color: Theme.of(context).textTheme.bodyLarge!.color!),
                  const SizedBox(width: Dimensions.space10),
                  CustomContainer(
                      name: LocalStrings.billableExpenses.tr,
                      //TODO: get the right value
                      number: '0.00',
                      color: ColorResources.colorOrange),
                ],
              ),
              const SizedBox(height: Dimensions.space15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomContainer(
                      name: LocalStrings.billedExpenses.tr,
                      //TODO: get the right value
                      number: '0.00',
                      color: ColorResources.greenColor),
                  const SizedBox(width: Dimensions.space10),
                  CustomContainer(
                      name: LocalStrings.unbilledExpenses.tr,
                      //TODO: get the right value
                      number: '0.00',
                      color: ColorResources.redColor),
                ],
              ),
              const CustomDivider(space: Dimensions.space15),
              Container(
                height: Dimensions.space60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimensions.cardRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: CustomLinerProgress(
                  color: ColorResources.redColor,
                  value: double.parse(
                          controller.projectDetailsModel.data!.progress!) *
                      .01,
                  name: LocalStrings.projectProgress.tr,
                  data: '${controller.projectDetailsModel.data!.progress!}%',
                ),
              ),
              const SizedBox(height: Dimensions.space20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: Dimensions.space60,
                      padding: const EdgeInsets.all(10),
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
                      child: CustomLinerProgress(
                        color: ColorResources.colorOrange,
                        //TODO: get the right value
                        value: 0.8,
                        name: LocalStrings.openTasks.tr,
                        //TODO: get open tasks and total tasks from api
                        data: '2/3',
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimensions.space8),
                  Expanded(
                    child: Container(
                      height: Dimensions.space60,
                      padding: const EdgeInsets.all(10),
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
                      child: CustomLinerProgress(
                        color: ColorResources.greenColor,
                        value: double.parse(daysLeft.toString()) * .01,
                        name: LocalStrings.daysLeft.tr,
                        data:
                            '${daysLeft > 0 ? daysLeft : 0}/${DateTime.parse(controller.projectDetailsModel.data!.deadline!).difference(DateTime.parse(controller.projectDetailsModel.data!.startDate!)).inDays.toString()}',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
