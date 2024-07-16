import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/data/controller/customer/customer_controller.dart';
import 'package:flutex_admin/data/repo/customer/customer_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/buttons/rounded_button.dart';
import 'package:flutex_admin/view/components/buttons/rounded_loading_button.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key, required this.id});
  final String id;

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(CustomerRepo(apiClient: Get.find()));
    final controller = Get.put(CustomerController(customerRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadContactCreateData();
    });
  }

  @override
  void dispose() {
    Get.find<CustomerController>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.addContact.tr,
      ),
      body: GetBuilder<CustomerController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  color: ColorResources.primaryColor,
                  onRefresh: () async {
                    await controller.loadContactCreateData();
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
                            labelText: LocalStrings.firstName.tr,
                            controller: controller.firstNameController,
                            focusNode: controller.firstNameFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.lastNameFocusNode,
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
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.lastName.tr,
                            controller: controller.lastNameController,
                            focusNode: controller.lastNameFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.emailFocusNode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocalStrings.enterLastName.tr;
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space10),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.email.tr,
                            controller: controller.emailController,
                            focusNode: controller.emailFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.titleFocusNode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocalStrings.enterEmail.tr;
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space10),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.title.tr,
                            controller: controller.titleController,
                            focusNode: controller.titleFocusNode,
                            textInputType: TextInputType.text,
                            nextFocus: controller.phoneFocusNode,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space10),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.phone.tr,
                            controller: controller.phoneController,
                            focusNode: controller.phoneFocusNode,
                            textInputType: TextInputType.number,
                            nextFocus: controller.passwordFocusNode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocalStrings.enterNumber.tr;
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space10),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.password.tr,
                            controller: controller.passwordController,
                            focusNode: controller.passwordFocusNode,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocalStrings.enterYourPassword.tr;
                              } else {
                                return null;
                              }
                            },
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
                                    controller.submitContact(
                                        context, widget.id);
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
