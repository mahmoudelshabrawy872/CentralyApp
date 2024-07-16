import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/customer/customer_controller.dart';
import 'package:flutex_admin/data/model/customer/groups_model.dart';
import 'package:flutex_admin/data/model/global/countries_model.dart';
import 'package:flutex_admin/data/repo/customer/customer_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/buttons/rounded_button.dart';
import 'package:flutex_admin/view/components/buttons/rounded_loading_button.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(CustomerRepo(apiClient: Get.find()));
    final controller = Get.put(CustomerController(customerRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadCustomerCreateData();
    });
  }

  @override
  void dispose() {
    Get.find<CustomerController>().clearCustomerData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.addCustomer.tr,
      ),
      body: GetBuilder<CustomerController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : ContainedTabBarView(
                  tabBarProperties: TabBarProperties(
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: ColorResources.blueGreyColor,
                      labelColor: Theme.of(context).textTheme.bodyLarge!.color,
                      labelStyle: regularDefault,
                      indicatorColor: ColorResources.secondaryColor,
                      labelPadding: const EdgeInsets.symmetric(
                          vertical: Dimensions.space15)),
                  tabs: [
                    Text(
                      LocalStrings.profile.tr,
                    ),
                    Text(
                      LocalStrings.billingAndShipping.tr,
                    ),
                  ],
                  views: [
                    Padding(
                      padding: const EdgeInsets.all(Dimensions.space10),
                      child: RefreshIndicator(
                        color: ColorResources.primaryColor,
                        onRefresh: () async {
                          await controller.loadCustomerCreateData();
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.companyName.tr,
                                controller: controller.companyController,
                                focusNode: controller.companyFocusNode,
                                textInputType: TextInputType.text,
                                nextFocus: controller.vatFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return LocalStrings.enterCompanyName.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space15),
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.vatNumber.tr,
                                controller: controller.vatController,
                                focusNode: controller.vatFocusNode,
                                textInputType: TextInputType.text,
                                nextFocus: controller.phoneFocusNode,
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
                                nextFocus: controller.addressFocusNode,
                                textInputType: TextInputType.text,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space10),
                              CustomDropDownTextField(
                                hintText: LocalStrings.selectGroup.tr,
                                onChanged: (value) {
                                  controller.groupController.text =
                                      value.toString();
                                },
                                items: controller.groupsModel.data!
                                    .map((Group value) {
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
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.city.tr,
                                controller: controller.cityController,
                                focusNode: controller.cityFocusNode,
                                nextFocus: controller.stateFocusNode,
                                textInputType: TextInputType.text,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space15),
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.state.tr,
                                controller: controller.stateController,
                                focusNode: controller.stateFocusNode,
                                nextFocus: controller.zipFocusNode,
                                textInputType: TextInputType.text,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space15),
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.zipCode.tr,
                                controller: controller.zipController,
                                focusNode: controller.zipFocusNode,
                                nextFocus: controller.countryFocusNode,
                                textInputType: TextInputType.text,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space10),
                              CustomDropDownTextField(
                                hintText: LocalStrings.selectCountry.tr,
                                onChanged: (value) {
                                  controller.countryController.text =
                                      value.toString();
                                },
                                items: controller.countriesModel.data!
                                    .map((Country value) {
                                  return DropdownMenuItem(
                                    value: value.countryId,
                                    child: Text(
                                      value.shortName?.tr ?? '',
                                      style: regularDefault.copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .color),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Dimensions.space10),
                      child: RefreshIndicator(
                        color: ColorResources.primaryColor,
                        onRefresh: () async {
                          await controller.loadCustomerCreateData();
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.billingStreet.tr,
                                controller: controller.billingStreetController,
                                focusNode: controller.billingStreetFocusNode,
                                textInputType: TextInputType.text,
                                nextFocus: controller.billingCityFocusNode,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space15),
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.billingCity.tr,
                                controller: controller.billingCityController,
                                focusNode: controller.billingCityFocusNode,
                                textInputType: TextInputType.text,
                                nextFocus: controller.billingStateFocusNode,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space15),
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.billingState.tr,
                                controller: controller.billingStateController,
                                focusNode: controller.billingStateFocusNode,
                                textInputType: TextInputType.number,
                                nextFocus: controller.billingZipFocusNode,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space15),
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.billingZip.tr,
                                controller: controller.billingZipController,
                                focusNode: controller.billingZipFocusNode,
                                textInputType: TextInputType.text,
                                nextFocus: controller.billingCountryFocusNode,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space10),
                              CustomDropDownTextField(
                                hintText: LocalStrings.selectBillingCountry.tr,
                                onChanged: (value) {
                                  controller.billingCountryController.text =
                                      value.toString();
                                },
                                items: controller.countriesModel.data!
                                    .map((Country value) {
                                  return DropdownMenuItem(
                                    value: value.countryId,
                                    child: Text(
                                      value.shortName?.tr ?? '',
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
                                labelText: LocalStrings.shippingStreet.tr,
                                controller: controller.shippingStreetController,
                                focusNode: controller.shippingStreetFocusNode,
                                textInputType: TextInputType.text,
                                nextFocus: controller.shippingCityFocusNode,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space15),
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.shippingCity.tr,
                                controller: controller.shippingCityController,
                                focusNode: controller.shippingCityFocusNode,
                                textInputType: TextInputType.text,
                                nextFocus: controller.shippingStateFocusNode,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space15),
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.shippingState.tr,
                                controller: controller.shippingStateController,
                                focusNode: controller.shippingStateFocusNode,
                                textInputType: TextInputType.number,
                                nextFocus: controller.shippingZipFocusNode,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space15),
                              CustomTextField(
                                animatedLabel: true,
                                needOutlineBorder: true,
                                labelText: LocalStrings.shippingZip.tr,
                                controller: controller.shippingZipController,
                                focusNode: controller.shippingZipFocusNode,
                                textInputType: TextInputType.text,
                                nextFocus: controller.shippingCountryFocusNode,
                                onChanged: (value) {
                                  return;
                                },
                              ),
                              const SizedBox(height: Dimensions.space10),
                              CustomDropDownTextField(
                                hintText: LocalStrings.selectShippingCountry.tr,
                                onChanged: (value) {
                                  controller.shippingCountryController.text =
                                      value.toString();
                                },
                                items: controller.countriesModel.data!
                                    .map((Country value) {
                                  return DropdownMenuItem(
                                    value: value.countryId,
                                    child: Text(
                                      value.shortName?.tr ?? '',
                                      style: regularDefault.copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .color),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10),
        child: GetBuilder<CustomerController>(builder: (controller) {
          return controller.submitLoading
              ? const RoundedLoadingBtn()
              : RoundedButton(
                  text: LocalStrings.submit.tr,
                  press: () {
                    controller.submitCustomer(context);
                  },
                );
        }),
      ),
    );
  }
}
