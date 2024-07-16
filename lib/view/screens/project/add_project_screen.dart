import 'package:date_field/date_field.dart';
import 'package:flutex_admin/core/helper/date_converter.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/project/project_controller.dart';
import 'package:flutex_admin/data/model/customer/customer_model.dart';
import 'package:flutex_admin/data/repo/project/project_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/buttons/rounded_button.dart';
import 'package:flutex_admin/view/components/buttons/rounded_loading_button.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ProjectRepo(apiClient: Get.find()));
    final controller = Get.put(ProjectController(projectRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadProjectCreateData();
    });
  }

  @override
  void dispose() {
    Get.find<ProjectController>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.addProject.tr,
      ),
      body: GetBuilder<ProjectController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  color: ColorResources.primaryColor,
                  onRefresh: () async {
                    await controller.loadProjectCreateData();
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
                            labelText: LocalStrings.name.tr,
                            controller: controller.nameController,
                            focusNode: controller.nameFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.clientIdFocusNode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocalStrings.enterFirstName.tr;
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space10),
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectClient.tr,
                            dropDownColor: Theme.of(context).cardColor,
                            onChanged: (value) {
                              controller.clientIdController.text = value;
                            },
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
                          const SizedBox(height: Dimensions.space10),
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectBillingType.tr,
                            onChanged: (value) {
                              controller.billingTypeController.text = value;
                              setState(() {});
                            },
                            dropDownColor: Theme.of(context).cardColor,
                            items: controller.billingType.entries
                                .map((MapEntry element) => DropdownMenuItem(
                                      value: element.key,
                                      child: Text(
                                        element.value,
                                        style: regularDefault.copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color),
                                      ),
                                    ))
                                .toList(),
                          ),
                          if (controller.billingTypeController.text == '1') ...[
                            const SizedBox(height: Dimensions.space15),
                            CustomTextField(
                              animatedLabel: true,
                              needOutlineBorder: true,
                              labelText: LocalStrings.totalRate.tr,
                              controller: controller.projectCostController,
                              focusNode: controller.projectCostFocusNode,
                              textInputType: TextInputType.number,
                              nextFocus: controller.statusFocusNode,
                              onChanged: (value) {
                                return;
                              },
                            ),
                          ],
                          if (controller.billingTypeController.text == '2') ...[
                            const SizedBox(height: Dimensions.space15),
                            CustomTextField(
                              animatedLabel: true,
                              needOutlineBorder: true,
                              labelText: LocalStrings.ratePerHour.tr,
                              controller:
                                  controller.projectRatePerHourController,
                              focusNode: controller.projectRatePerHourFocusNode,
                              textInputType: TextInputType.number,
                              nextFocus: controller.statusFocusNode,
                              onChanged: (value) {
                                return;
                              },
                            ),
                          ],
                          const SizedBox(height: Dimensions.space10),
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectStatus.tr,
                            onChanged: (value) {
                              controller.statusController.text = value;
                            },
                            dropDownColor: Theme.of(context).cardColor,
                            items: controller.projectStatus.entries
                                .map((MapEntry element) => DropdownMenuItem(
                                      value: element.key,
                                      child: Text(
                                        element.value,
                                        style: regularDefault.copyWith(
                                            color: ColorResources
                                                .projectStatusColor(
                                                    element.key)),
                                      ),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(height: Dimensions.space15),
                          DateTimeFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 5, left: 15, right: 15, bottom: 5),
                              labelText: LocalStrings.startDate.tr,
                              labelStyle: regularDefault.copyWith(
                                  color: Theme.of(context).hintColor),
                              fillColor: Theme.of(context).cardColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context).hintColor),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.defaultRadius)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context).hintColor),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.defaultRadius)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context).hintColor),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.defaultRadius)),
                              suffixIcon: Icon(
                                Icons.calendar_month,
                                size: 25,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            style: regularDefault.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color),
                            mode: DateTimeFieldPickerMode.date,
                            autovalidateMode: AutovalidateMode.always,
                            onChanged: (DateTime? value) {
                              controller.startDateController.text =
                                  DateConverter.formatDate(value!);
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          DateTimeFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 5, left: 15, right: 15, bottom: 5),
                              labelText: LocalStrings.endDate.tr,
                              labelStyle: regularDefault.copyWith(
                                  color: Theme.of(context).hintColor),
                              fillColor: Theme.of(context).cardColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context).hintColor),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.defaultRadius)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context).hintColor),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.defaultRadius)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context).hintColor),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.defaultRadius)),
                              suffixIcon: Icon(
                                Icons.calendar_month,
                                size: 25,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            style: regularDefault.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color),
                            mode: DateTimeFieldPickerMode.date,
                            autovalidateMode: AutovalidateMode.always,
                            onChanged: (DateTime? value) {
                              controller.deadlineController.text =
                                  DateConverter.formatDate(value!);
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.description.tr,
                            textInputType: TextInputType.multiline,
                            maxLines: 3,
                            focusNode: controller.descriptionFocusNode,
                            controller: controller.descriptionController,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space25),
                          controller.submitLoading
                              ? const RoundedLoadingBtn()
                              : RoundedButton(
                                  text: LocalStrings.submit.tr,
                                  press: () {
                                    controller.submitProject(context);
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
