import 'package:flutex_admin/core/helper/string_format_helper.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/lead/lead_controller.dart';
import 'package:flutex_admin/data/model/lead/sources_model.dart';
import 'package:flutex_admin/data/model/lead/statuses_model.dart';
import 'package:flutex_admin/data/repo/lead/lead_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/buttons/rounded_button.dart';
import 'package:flutex_admin/view/components/buttons/rounded_loading_button.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLeadScreen extends StatefulWidget {
  const AddLeadScreen({super.key});

  @override
  State<AddLeadScreen> createState() => _AddLeadScreenState();
}

class _AddLeadScreenState extends State<AddLeadScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(LeadRepo(apiClient: Get.find()));
    final controller = Get.put(LeadController(leadRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadLeadCreateData();
    });
  }

  @override
  void dispose() {
    Get.find<LeadController>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.createNewLead.tr,
      ),
      body: GetBuilder<LeadController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  color: ColorResources.primaryColor,
                  onRefresh: () async {
                    await controller.loadLeadCreateData();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.space15),
                      child: Column(
                        children: [
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectSource.tr,
                            onChanged: (value) {
                              controller.sourceController.text =
                                  value.toString();
                            },
                            items: controller.sourcesModel.data!
                                .map((Source value) {
                              return DropdownMenuItem(
                                value: value.id,
                                child: Text(
                                  value.name?.tr ?? '',
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
                            hintText: LocalStrings.selectStatus.tr,
                            onChanged: (value) {
                              controller.statusController.text =
                                  value.toString();
                            },
                            items: controller.statusesModel.data!
                                .map((Status value) {
                              return DropdownMenuItem(
                                value: value.id,
                                child: Text(
                                  value.name?.tr ?? '',
                                  style: regularDefault.copyWith(
                                      color: Converter.hexStringToColor(
                                          value.color ?? '')),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.name.tr,
                            controller: controller.nameController,
                            focusNode: controller.nameFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.contactFocusNode,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.contact.tr,
                            controller: controller.contactController,
                            focusNode: controller.contactFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.titleFocusNode,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.title.tr,
                            controller: controller.titleController,
                            focusNode: controller.titleFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.emailFocusNode,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.email.tr,
                            controller: controller.emailController,
                            focusNode: controller.emailFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.websiteFocusNode,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.website.tr,
                            controller: controller.websiteController,
                            focusNode: controller.websiteFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.phoneNumberFocusNode,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.phone.tr,
                            controller: controller.phoneNumberController,
                            focusNode: controller.phoneNumberFocusNode,
                            textInputType: TextInputType.number,
                            nextFocus: controller.companyFocusNode,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.company.tr,
                            controller: controller.companyController,
                            focusNode: controller.companyFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.addressFocusNode,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.address.tr,
                            controller: controller.addressController,
                            focusNode: controller.addressFocusNode,
                            textInputType: TextInputType.text,
                            onChanged: (value) {
                              return;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10),
        child: GetBuilder<LeadController>(builder: (controller) {
          return controller.isSubmitLoading
              ? const RoundedLoadingBtn()
              : RoundedButton(
                  text: LocalStrings.submit.tr,
                  press: () {
                    controller.submitLead(context);
                  },
                );
        }),
      ),
    );
  }
}
