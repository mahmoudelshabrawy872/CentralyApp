import 'package:flutex_admin/core/helper/date_converter.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/ticket/ticket_controller.dart';
import 'package:flutex_admin/data/repo/ticket/ticket_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/divider/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(TicketRepo(apiClient: Get.find()));
    final controller = Get.put(TicketController(ticketRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadTicketDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.ticketDetails.tr,
      ),
      body: GetBuilder<TicketController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  color: ColorResources.primaryColor,
                  onRefresh: () async {
                    await controller.loadTicketDetails(widget.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.space12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.all(Dimensions.space10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.cardRadius),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '#${controller.ticketDetailsModel.data!.id!} - ${controller.ticketDetailsModel.data!.subject!}',
                                style: regularLarge,
                              ),
                              const CustomDivider(space: Dimensions.space5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '- ${LocalStrings.department.tr}: ${controller.ticketDetailsModel.data!.departmentName ?? ''}',
                                        style: lightSmall,
                                      ),
                                      Text(
                                        '- ${LocalStrings.submitted.tr}: ${DateConverter.formatValidityDate(controller.ticketDetailsModel.data!.date ?? '')}',
                                        style: lightSmall,
                                      ),
                                      Text(
                                        '- ${LocalStrings.contact.tr}: ${controller.ticketDetailsModel.data!.userFirstName ?? ''} ${controller.ticketDetailsModel.data!.userLastName ?? ''}',
                                        style: lightSmall,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '- ${LocalStrings.status.tr}: ${controller.ticketDetailsModel.data!.statusName ?? ''}',
                                        style: lightSmall,
                                      ),
                                      Text(
                                        '- ${LocalStrings.priority.tr}: ${controller.ticketDetailsModel.data!.priorityName!}',
                                        style: lightSmall,
                                      ),
                                      Text(
                                        '- ${LocalStrings.service.tr}: ${controller.ticketDetailsModel.data!.serviceName ?? ''}',
                                        style: lightSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
