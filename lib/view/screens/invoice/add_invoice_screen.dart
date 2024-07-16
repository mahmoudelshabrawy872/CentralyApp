import 'package:date_field/date_field.dart';
import 'package:flutex_admin/core/helper/date_converter.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/invoice/invoice_controller.dart';
import 'package:flutex_admin/data/model/customer/customer_model.dart';
import 'package:flutex_admin/data/model/global/currencies_model.dart';
import 'package:flutex_admin/data/model/global/payment_modes_model.dart';
//import 'package:flutex_admin/data/model/global/taxes_model.dart';
import 'package:flutex_admin/data/repo/invoice/invoice_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/buttons/rounded_button.dart';
import 'package:flutex_admin/view/components/buttons/rounded_loading_button.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:flutex_admin/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class AddInvoiceScreen extends StatefulWidget {
  const AddInvoiceScreen({super.key});

  @override
  State<AddInvoiceScreen> createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(InvoiceRepo(apiClient: Get.find()));
    final controller = Get.put(InvoiceController(invoiceRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadInvoiceCreateData();
    });
  }

  @override
  void dispose() {
    Get.find<InvoiceController>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.addInvoice.tr,
      ),
      body: GetBuilder<InvoiceController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  color: ColorResources.primaryColor,
                  onRefresh: () async {
                    await controller.loadInvoiceCreateData();
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
                            labelText: LocalStrings.number.tr,
                            controller: controller.numberController,
                            focusNode: controller.numberFocusNode,
                            textInputType: TextInputType.number,
                            nextFocus: controller.clientFocusNode,
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
                          const SizedBox(height: Dimensions.space15),
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectClient.tr,
                            dropDownColor: Theme.of(context).cardColor,
                            onChanged: (value) {
                              controller.clientController.text = value;
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
                          const SizedBox(height: Dimensions.space15),
                          Row(
                            children: [
                              Expanded(
                                child: DateTimeFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    labelText: LocalStrings.date.tr,
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
                                    suffixIcon: const Icon(
                                      Icons.calendar_month,
                                      size: 25,
                                      color: ColorResources.secondaryColor,
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
                                    controller.dateController.text =
                                        DateConverter.formatDate(value!);
                                  },
                                ),
                              ),
                              const SizedBox(width: Dimensions.space5),
                              Expanded(
                                child: DateTimeFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    labelText: LocalStrings.dueDate.tr,
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
                                    suffixIcon: const Icon(
                                      Icons.calendar_month,
                                      size: 25,
                                      color: ColorResources.secondaryColor,
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
                                    controller.dueDateController.text =
                                        DateConverter.formatDate(value!);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.billingStreet.tr,
                            controller: controller.billingStreetController,
                            focusNode: controller.billingStreetFocusNode,
                            textInputType: TextInputType.text,
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
                          const SizedBox(height: Dimensions.space15),
                          CustomDropDownTextField(
                            hintText: LocalStrings.selectCurrency.tr,
                            onChanged: (value) {
                              controller.currencyController.text = value;
                            },
                            dropDownColor: Theme.of(context).cardColor,
                            items: controller.currenciesModel.data!
                                .map((Currency value) {
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
                          MultiSelectDropDown(
                            controller: controller.paymentModeController,
                            hint: LocalStrings.selectPaymentMode.tr,
                            hintColor: Theme.of(context).hintColor,
                            onOptionSelected: (options) {
                              controller.allowedPaymentModesList.clear();
                              for (var v in options) {
                                controller.allowedPaymentModesList
                                    .add(v.value.toString());
                              }
                              debugPrint(controller.allowedPaymentModesList
                                  .toString());
                            },
                            options: controller.paymentModesModel.data!
                                .map((PaymentMode value) {
                              return ValueItem(
                                  label: value.name?.tr ?? '', value: value.id);
                            }).toList(),
                            selectionType: SelectionType.multi,
                            chipConfig:
                                const ChipConfig(wrapType: WrapType.scroll),
                            fieldBackgroundColor: Theme.of(context).cardColor,
                            optionsBackgroundColor: Theme.of(context).cardColor,
                            dropdownBackgroundColor:
                                Theme.of(context).cardColor,
                            selectedOptionBackgroundColor:
                                Theme.of(context).cardColor,
                            optionTextStyle: regularDefault.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color),
                            selectedOptionIcon: const Icon(
                              Icons.check_circle,
                              color: ColorResources.secondaryColor,
                            ),
                          ),
                          // Items Section Start
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Dimensions.space15),
                            child: Row(
                              children: [
                                Container(
                                  width: Dimensions.space3,
                                  height: Dimensions.space15,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: Dimensions.space5),
                                Text(
                                  LocalStrings.items.tr,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        '${LocalStrings.showQuantityAs.tr}:',
                                        style: lightSmall.copyWith(
                                            color:
                                                ColorResources.blueGreyColor),
                                      ),
                                      const SizedBox(width: Dimensions.space5),
                                      const Icon(
                                        Icons.circle,
                                        size: Dimensions.space15,
                                        color: ColorResources.blueGreyColor,
                                      ),
                                      Text(
                                        ' ${LocalStrings.qty.tr}',
                                        style: lightSmall.copyWith(
                                            color:
                                                ColorResources.blueGreyColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(Dimensions.space15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorResources.blueGreyColor,
                                ),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.space10)),
                            child: Column(
                              children: [
                                CustomTextField(
                                  animatedLabel: true,
                                  needOutlineBorder: true,
                                  isRequired: true,
                                  labelText: LocalStrings.itemName.tr,
                                  controller: controller.itemController,
                                  focusNode: controller.itemFocusNode,
                                  textInputType: TextInputType.text,
                                  nextFocus: controller.descriptionFocusNode,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return LocalStrings.enterItemName.tr;
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
                                  textInputType: TextInputType.text,
                                  controller: controller.descriptionController,
                                  focusNode: controller.descriptionFocusNode,
                                  nextFocus: controller.qtyFocusNode,
                                  onChanged: (value) {
                                    return;
                                  },
                                ),
                                const SizedBox(height: Dimensions.space15),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 4,
                                      child: CustomTextField(
                                        animatedLabel: true,
                                        needOutlineBorder: true,
                                        labelText: LocalStrings.qty.tr,
                                        textInputType: TextInputType.number,
                                        controller: controller.qtyController,
                                        focusNode: controller.qtyFocusNode,
                                        nextFocus: controller.unitFocusNode,
                                        onChanged: (value) {
                                          return;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: Dimensions.space5),
                                    Flexible(
                                      flex: 2,
                                      child: CustomTextField(
                                        animatedLabel: true,
                                        needOutlineBorder: true,
                                        labelText: LocalStrings.unit.tr,
                                        textInputType: TextInputType.text,
                                        controller: controller.unitController,
                                        focusNode: controller.unitFocusNode,
                                        nextFocus: controller.rateFocusNode,
                                        onChanged: (value) {
                                          return;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: Dimensions.space15),
                                CustomTextField(
                                  animatedLabel: true,
                                  needOutlineBorder: true,
                                  labelText: LocalStrings.rate.tr,
                                  textInputType: TextInputType.number,
                                  focusNode: controller.rateFocusNode,
                                  controller: controller.rateController,
                                  onChanged: (value) {
                                    controller.calculateInvoiceAmount();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return LocalStrings.enterRate.tr;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: controller.invoiceItemList.isEmpty
                                  ? 0
                                  : Dimensions.space15),
                          ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.invoiceItemList.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: Dimensions.space15),
                            itemBuilder: (context, index) {
                              return Badge(
                                offset: const Offset(-10, -10),
                                backgroundColor: ColorResources.colorRed,
                                largeSize: Dimensions.space23,
                                label: GestureDetector(
                                  onTap: () {
                                    controller.decreaseItemField(index);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: ColorResources.colorRed,
                                        shape: BoxShape.circle),
                                    child: const Icon(Icons.clear,
                                        color: ColorResources.colorWhite,
                                        size: 15),
                                  ),
                                ),
                                child: Container(
                                  padding:
                                      const EdgeInsets.all(Dimensions.space15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorResources.blueGreyColor,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.space10)),
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        animatedLabel: true,
                                        needOutlineBorder: true,
                                        labelText: LocalStrings.itemName.tr,
                                        controller: controller
                                            .invoiceItemList[index]
                                            .itemNameController,
                                        textInputType: TextInputType.text,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return LocalStrings
                                                .enterItemName.tr;
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (value) {
                                          return;
                                        },
                                      ),
                                      const SizedBox(
                                          height: Dimensions.space15),
                                      CustomTextField(
                                        animatedLabel: true,
                                        needOutlineBorder: true,
                                        labelText: LocalStrings.description.tr,
                                        textInputType: TextInputType.text,
                                        controller: controller
                                            .invoiceItemList[index]
                                            .descriptionController,
                                        onChanged: (value) {
                                          return;
                                        },
                                      ),
                                      const SizedBox(
                                          height: Dimensions.space15),
                                      Row(
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: CustomTextField(
                                              animatedLabel: true,
                                              needOutlineBorder: true,
                                              labelText: LocalStrings.qty.tr,
                                              textInputType:
                                                  TextInputType.number,
                                              controller: controller
                                                  .invoiceItemList[index]
                                                  .qtyController,
                                              onChanged: (value) {
                                                return;
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                              width: Dimensions.space5),
                                          Flexible(
                                            flex: 2,
                                            child: CustomTextField(
                                              animatedLabel: true,
                                              needOutlineBorder: true,
                                              labelText: LocalStrings.unit.tr,
                                              textInputType: TextInputType.text,
                                              controller: controller
                                                  .invoiceItemList[index]
                                                  .unitController,
                                              onChanged: (value) {
                                                return;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                          height: Dimensions.space15),
                                      CustomTextField(
                                        animatedLabel: true,
                                        needOutlineBorder: true,
                                        labelText: LocalStrings.rate.tr,
                                        textInputType: TextInputType.number,
                                        controller: controller
                                            .invoiceItemList[index]
                                            .rateController,
                                        onChanged: (value) {
                                          controller.calculateInvoiceAmount();
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return LocalStrings.enterRate.tr;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          GestureDetector(
                            onTap: () => controller.increaseItemField(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.add_circle_outline_rounded,
                                    color: ColorResources.secondaryColor,
                                    size: 20),
                                const SizedBox(width: Dimensions.space10),
                                Text(LocalStrings.addItems.tr,
                                    style: regularDefault.copyWith(
                                        color: ColorResources.secondaryColor))
                              ],
                            ),
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.clientNote.tr,
                            controller: controller.clientNoteController,
                            focusNode: controller.clientNoteFocusNode,
                            textInputType: TextInputType.multiline,
                            maxLines: 4,
                            nextFocus: controller.termsFocusNode,
                            onChanged: (value) {
                              return;
                            },
                          ),
                          const SizedBox(height: Dimensions.space15),
                          CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: LocalStrings.terms.tr,
                            controller: controller.termsController,
                            focusNode: controller.termsFocusNode,
                            textInputType: TextInputType.multiline,
                            maxLines: 4,
                            onChanged: (value) {
                              return;
                            },
                          ),
                        ],
                      ),
                    ),
                  ));
        },
      ),
      bottomNavigationBar: GetBuilder<InvoiceController>(builder: (controller) {
        return controller.isLoading
            ? const CustomLoader()
            : controller.isSubmitLoading
                ? const RoundedLoadingBtn()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.space10),
                    child: RoundedButton(
                      text: LocalStrings.submit.tr,
                      press: () {
                        controller.submitInvoice(context);
                      },
                    ),
                  );
      }),
    );
  }
}
