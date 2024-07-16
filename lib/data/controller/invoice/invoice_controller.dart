import 'dart:async';
import 'dart:convert';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/data/model/authorization/authorization_response_model.dart';
import 'package:flutex_admin/data/model/customer/customer_model.dart';
import 'package:flutex_admin/data/model/global/currencies_model.dart';
import 'package:flutex_admin/data/model/global/payment_modes_model.dart';
//import 'package:flutex_admin/data/model/global/taxes_model.dart';
import 'package:flutex_admin/data/model/invoice/invoice_details_model.dart';
import 'package:flutex_admin/data/model/invoice/invoice_item_model.dart';
import 'package:flutex_admin/data/model/invoice/invoice_model.dart';
import 'package:flutex_admin/data/model/invoice/invoice_post_model.dart';
import 'package:flutex_admin/data/repo/invoice/invoice_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class InvoiceController extends GetxController {
  InvoiceRepo invoiceRepo;
  InvoiceController({required this.invoiceRepo});

  bool isLoading = true;
  bool isSubmitLoading = false;
  InvoicesModel invoicesModel = InvoicesModel();
  InvoiceDetailsModel invoiceDetailsModel = InvoiceDetailsModel();
  CustomersModel customersModel = CustomersModel();
  CurrenciesModel currenciesModel = CurrenciesModel();
  //TaxesModel taxesModel = TaxesModel();
  PaymentModesModel paymentModesModel = PaymentModesModel();
  List<InvoiceItemModel> invoiceItemList = [];
  List<String> allowedPaymentModesList = [];

  Future<void> initialData({bool shouldLoad = true}) async {
    isLoading = shouldLoad ? true : false;
    update();

    await loadInvoices();
    isLoading = false;
    update();
  }

  Future<void> loadInvoices() async {
    ResponseModel responseModel = await invoiceRepo.getAllInvoices();
    invoicesModel =
        InvoicesModel.fromJson(jsonDecode(responseModel.responseJson));
    isLoading = false;
    update();
  }

  Future<void> loadInvoiceDetails(invoiceId) async {
    ResponseModel responseModel =
        await invoiceRepo.getInvoiceDetails(invoiceId);
    if (responseModel.statusCode == 200) {
      invoiceDetailsModel =
          InvoiceDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
    } else {
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isLoading = false;
    update();
  }

  Future<void> loadInvoiceCreateData() async {
    ResponseModel customersResponseModel = await invoiceRepo.getAllCustomers();
    customersModel = CustomersModel.fromJson(
        jsonDecode(customersResponseModel.responseJson));
    ResponseModel currenciesResponseModel = await invoiceRepo.getCurrencies();
    currenciesModel = CurrenciesModel.fromJson(
        jsonDecode(currenciesResponseModel.responseJson));
    //ResponseModel taxesResponseModel = await invoiceRepo.getTaxes();
    //taxesModel = TaxesModel.fromJson(jsonDecode(taxesResponseModel.responseJson));
    ResponseModel paymentModesResponseModel =
        await invoiceRepo.getPaymentModes();
    paymentModesModel = PaymentModesModel.fromJson(
        jsonDecode(paymentModesResponseModel.responseJson));
    isLoading = false;
    update();
  }

  TextEditingController numberController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController billingStreetController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  MultiSelectController<dynamic> paymentModeController =
      MultiSelectController();
  TextEditingController clientNoteController = TextEditingController();
  TextEditingController termsController = TextEditingController();

  TextEditingController itemController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  FocusNode numberFocusNode = FocusNode();
  FocusNode clientFocusNode = FocusNode();
  FocusNode dateFocusNode = FocusNode();
  FocusNode dueDateFocusNode = FocusNode();
  FocusNode billingStreetFocusNode = FocusNode();
  FocusNode currencyFocusNode = FocusNode();
  FocusNode clientNoteFocusNode = FocusNode();
  FocusNode termsFocusNode = FocusNode();

  FocusNode itemFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode qtyFocusNode = FocusNode();
  FocusNode unitFocusNode = FocusNode();
  FocusNode rateFocusNode = FocusNode();

  void increaseItemField() {
    invoiceItemList.add(InvoiceItemModel(
      itemNameController: TextEditingController(),
      descriptionController: TextEditingController(),
      qtyController: TextEditingController(),
      unitController: TextEditingController(),
      rateController: TextEditingController(),
    ));
    update();
  }

  void decreaseItemField(int index) {
    invoiceItemList.removeAt(index);
    calculateInvoiceAmount();
    update();
  }

  String totalInvoiceAmount = '';

  void calculateInvoiceAmount() {
    double totalAmount = 0;

    double firstInvoiceAmount =
        double.tryParse(rateController.text.toString()) ?? 0;
    double firstInvoiceQty =
        double.tryParse(qtyController.text.toString()) ?? 0;

    totalAmount = totalAmount + (firstInvoiceAmount * firstInvoiceQty);

    for (var invoice in invoiceItemList) {
      double invoiceAmount = double.tryParse(invoice.rateController.text) ?? 0;
      double invoiceQty = double.tryParse(invoice.qtyController.text) ?? 0;
      totalAmount = totalAmount + (invoiceAmount * invoiceQty);
    }

    totalInvoiceAmount = totalAmount.toString();

    update();
  }

  Future<void> submitInvoice(BuildContext context) async {
    String number = numberController.text.toString();
    String client = clientController.text.toString();
    String date = dateController.text.toString();
    String dueDate = dueDateController.text.toString();
    String billingStreet = billingStreetController.text.toString();
    String currency = currencyController.text.toString();
    String clientNote = clientNoteController.text.toString();
    String terms = termsController.text.toString();

    if (number.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterNumber.tr]);
      return;
    }

    if (client.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.selectClient.tr]);
      return;
    }

    if (date.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterStartDate.tr]);
      return;
    }

    if (currency.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.selectCurrency.tr]);
      return;
    }

    if (billingStreet.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.billingStreet.tr]);
      return;
    }

    String firstItemName = itemController.text.toString();
    String firstItemDescription = descriptionController.text.toString();
    String firstItemQty = qtyController.text.toString();
    String firstItemRate = rateController.text.toString();
    String firstItemUnit = unitController.text.toString();

    if (firstItemName.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterItemName.tr]);
      return;
    }
    if (firstItemQty.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterItemQty.tr]);
      return;
    }
    if (firstItemRate.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterRate.tr]);
      return;
    }

    isSubmitLoading = true;
    update();

    InvoicePostModel invoiceModel = InvoicePostModel(
      clientId: client,
      number: number,
      date: date,
      duedate: dueDate,
      currency: currency,
      firstItemName: firstItemName,
      firstItemDescription: firstItemDescription,
      firstItemQty: firstItemQty,
      firstItemRate: firstItemRate,
      firstItemUnit: firstItemUnit,
      newItems: invoiceItemList,
      subtotal: totalInvoiceAmount, // TODO: SUBTOTAL
      total: totalInvoiceAmount,
      billingStreet: billingStreet,
      allowedPaymentModes: allowedPaymentModesList,
      clientNote: clientNote,
      terms: terms,
    );

    ResponseModel responseModel = await invoiceRepo.createInvoice(invoiceModel);
    if (responseModel.statusCode == 200) {
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(
          jsonDecode(responseModel.responseJson));
      if (model.status!) {
        if (context.mounted) Navigator.pop(context);
        await initialData();
        CustomSnackBar.success(successList: [model.message!]);
      } else {
        CustomSnackBar.error(errorList: [model.message!]);
      }
    } else {
      CustomSnackBar.error(errorList: [responseModel.message]);
      return;
    }

    isSubmitLoading = false;
    update();
  }

  void clearData() {
    isLoading = false;
    isSubmitLoading = false;
    numberController.text = '';
    clientController.text = '';
    dateController.text = '';
    dueDateController.text = '';
    billingStreetController.text = '';
    currencyController.text = '';
    clientNoteController.text = '';
    termsController.text = '';

    itemController.text = '';
    descriptionController.text = '';
    qtyController.text = '';
    unitController.text = '';
    rateController.text = '';

    invoiceItemList.clear();
    allowedPaymentModesList.clear();
  }
}
