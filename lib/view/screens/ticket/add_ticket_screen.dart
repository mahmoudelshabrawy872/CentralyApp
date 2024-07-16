import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/ticket/ticket_controller.dart';
import 'package:flutex_admin/data/model/customer/customer_model.dart';
import 'package:flutex_admin/data/model/ticket/departments_model.dart';
import 'package:flutex_admin/data/model/ticket/priorities_model.dart';
import 'package:flutex_admin/data/model/ticket/services_model.dart';
import 'package:flutex_admin/data/repo/ticket/ticket_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/buttons/rounded_button.dart';
import 'package:flutex_admin/view/components/buttons/rounded_loading_button.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTicketScreen extends StatefulWidget {
  const AddTicketScreen({super.key});

  @override
  State<AddTicketScreen> createState() => _AddTicketScreenState();
}

class _AddTicketScreenState extends State<AddTicketScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(TicketRepo(apiClient: Get.find()));
    final controller = Get.put(TicketController(ticketRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadTicketCreateData();
    });
  }

  @override
  void dispose() {
    Get.find<TicketController>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.createNewTicket.tr,
      ),
      body: GetBuilder<TicketController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  color: ColorResources.primaryColor,
                  onRefresh: () async {
                    await controller.loadTicketCreateData();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimensions.space15,
                          horizontal: Dimensions.space10),
                      child: Column(
                        children: [
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.subject.tr,
                            controller: controller.subjectController,
                            focusNode: controller.subjectFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.userFocusNode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocalStrings.enterSubject.tr;
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectClient.tr,
                            onChanged: (value) {
                              controller.userController.text = value;
                            },
                            dropDownColor: Theme.of(context).cardColor,
                            items: controller.customersModel.data!
                                .map((Customer value) {
                              return DropdownMenuItem(
                                value: value.userId,
                                child: Text(
                                  value.company ?? '',
                                  style: regularDefault.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectContact.tr,
                            onChanged: (value) {
                              controller.userController.text = value;
                            },
                            dropDownColor: Theme.of(context).cardColor,
                            items: controller.customersModel.data!
                                .map((Customer value) {
                              return DropdownMenuItem(
                                value: value.userId,
                                child: Text(
                                  value.company ?? '',
                                  style: regularDefault.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectDepartment.tr,
                            onChanged: (value) {
                              controller.departmentController.text = value;
                            },
                            dropDownColor: Theme.of(context).cardColor,
                            items: controller.departmentModel.data!
                                .map((Department value) {
                              return DropdownMenuItem(
                                value: value.id,
                                child: Text(
                                  value.name ?? '',
                                  style: regularDefault.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectPriority.tr,
                            onChanged: (value) {
                              controller.priorityController.text = value;
                            },
                            dropDownColor: Theme.of(context).cardColor,
                            items: controller.priorityModel.data!
                                .map((Priority value) {
                              return DropdownMenuItem(
                                value: value.id,
                                child: Text(
                                  value.name ?? '',
                                  style: regularDefault.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectService.tr,
                            onChanged: (value) {
                              controller.serviceController.text = value;
                            },
                            dropDownColor: Theme.of(context).cardColor,
                            items: controller.serviceModel.data!
                                .map((Service value) {
                              return DropdownMenuItem(
                                value: value.id,
                                child: Text(
                                  value.name ?? '',
                                  style: regularDefault.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.description.tr,
                            textInputType: TextInputType.multiline,
                            maxLines: 2,
                            focusNode: controller.descriptionFocusNode,
                            controller: controller.descriptionController,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space25),
                          controller.isSubmitLoading
                              ? const RoundedLoadingBtn()
                              : RoundedButton(
                                  text: LocalStrings.submit.tr,
                                  press: () {
                                    controller.submitTicket(context);
                                  },
                                ),
                        ],
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}
