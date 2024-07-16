import 'package:date_field/date_field.dart';
import 'package:flutex_admin/core/helper/date_converter.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/contract/contract_controller.dart';
import 'package:flutex_admin/data/model/customer/customer_model.dart';
import 'package:flutex_admin/data/repo/contract/contract_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/buttons/rounded_button.dart';
import 'package:flutex_admin/view/components/buttons/rounded_loading_button.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContractScreen extends StatefulWidget {
  const AddContractScreen({super.key});

  @override
  State<AddContractScreen> createState() => _AddContractScreenState();
}

class _AddContractScreenState extends State<AddContractScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ContractRepo(apiClient: Get.find()));
    final controller = Get.put(ContractController(contractRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadContractCreateData();
    });
  }

  @override
  void dispose() {
    Get.find<ContractController>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.addContract.tr,
      ),
      body: GetBuilder<ContractController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  color: ColorResources.primaryColor,
                  onRefresh: () async {
                    await controller.loadContractCreateData();
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
                            nextFocus: controller.clientFocusNode,
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
                              controller.clientController.text = value;
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
                              controller.dateStartController.text =
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
                              controller.dateEndController.text =
                                  DateConverter.formatDate(value!);
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.contractValue.tr,
                            controller: controller.contractValueController,
                            focusNode: controller.contractValueFocusNode,
                            textInputType: TextInputType.number,
                            nextFocus: controller.descriptionFocusNode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocalStrings.enterValue.tr;
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
                            labelText: LocalStrings.description.tr,
                            textInputType: TextInputType.multiline,
                            maxLines: 2,
                            focusNode: controller.descriptionFocusNode,
                            controller: controller.descriptionController,
                            nextFocus: controller.contentFocusNode,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.content.tr,
                            textInputType: TextInputType.multiline,
                            maxLines: 5,
                            focusNode: controller.contentFocusNode,
                            controller: controller.contentController,
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
                                    controller.submitContract(context);
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
