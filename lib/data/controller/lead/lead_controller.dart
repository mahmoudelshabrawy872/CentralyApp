import 'dart:async';
import 'dart:convert';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/data/model/authorization/authorization_response_model.dart';
import 'package:flutex_admin/data/model/lead/lead_create_model.dart';
import 'package:flutex_admin/data/model/lead/lead_details_model.dart';
import 'package:flutex_admin/data/model/lead/lead_model.dart';
import 'package:flutex_admin/data/model/lead/sources_model.dart';
import 'package:flutex_admin/data/model/lead/statuses_model.dart';
import 'package:flutex_admin/data/repo/lead/lead_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/view/components/snack_bar/show_custom_snackbar.dart';

class LeadController extends GetxController {
  LeadRepo leadRepo;
  LeadController({required this.leadRepo});

  bool isLoading = true;
  bool isSubmitLoading = false;
  LeadsModel leadsModel = LeadsModel();
  LeadDetailsModel leadDetailsModel = LeadDetailsModel();

  StatusesModel statusesModel = StatusesModel();
  SourcesModel sourcesModel = SourcesModel();

  Future<void> initialData({bool shouldLoad = true}) async {
    isLoading = shouldLoad ? true : false;
    update();

    await loadLeads();
    isLoading = false;
    update();
  }

  Future<void> loadLeads() async {
    ResponseModel responseModel = await leadRepo.getAllLeads();
    leadsModel = LeadsModel.fromJson(jsonDecode(responseModel.responseJson));
    isLoading = false;
    update();
  }

  Future<void> loadLeadDetails(leadId) async {
    ResponseModel responseModel = await leadRepo.getLeadDetails(leadId);
    if (responseModel.statusCode == 200) {
      leadDetailsModel =
          LeadDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
    } else {
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isLoading = false;
    update();
  }

  Future<void> loadLeadCreateData() async {
    ResponseModel statusesResponseModel = await leadRepo.getLeadStatuses();
    ResponseModel sourcesResponseModel = await leadRepo.getLeadSources();
    statusesModel =
        StatusesModel.fromJson(jsonDecode(statusesResponseModel.responseJson));
    sourcesModel =
        SourcesModel.fromJson(jsonDecode(sourcesResponseModel.responseJson));
    isLoading = false;
    update();
  }

  TextEditingController sourceController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController assignedController = TextEditingController();
  TextEditingController clientIdController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController defaultLanguageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController customContactDateController = TextEditingController();
  TextEditingController contactedTodayController = TextEditingController();
  TextEditingController isPublicController = TextEditingController();

  FocusNode sourceFocusNode = FocusNode();
  FocusNode statusFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode assignedFocusNode = FocusNode();
  FocusNode clientIdFocusNode = FocusNode();
  FocusNode tagsFocusNode = FocusNode();
  FocusNode contactFocusNode = FocusNode();
  FocusNode titleFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode websiteFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode companyFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();
  FocusNode stateFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode defaultLanguageFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode customContactDateFocusNode = FocusNode();
  FocusNode contactedTodayFocusNode = FocusNode();
  FocusNode isPublicFocusNode = FocusNode();

  Future<void> submitLead(BuildContext context) async {
    String source = sourceController.text.toString();
    String status = statusController.text.toString();
    String name = nameController.text.toString();
    String assigned = assignedController.text.toString();
    String clientId = clientIdController.text.toString();
    String tags = tagsController.text.toString();
    String contact = contactController.text.toString();
    String title = titleController.text.toString();
    String email = emailController.text.toString();
    String website = websiteController.text.toString();
    String phoneNumber = phoneNumberController.text.toString();
    String company = companyController.text.toString();
    String address = addressController.text.toString();
    String city = cityController.text.toString();
    String state = stateController.text.toString();
    String country = countryController.text.toString();
    String defaultLanguage = defaultLanguageController.text.toString();
    String description = descriptionController.text.toString();
    String customContactDate = customContactDateController.text.toString();
    String contactedToday = contactedTodayController.text.toString();
    String isPublic = isPublicController.text.toString();

    if (source.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.pleaseSelectSource.tr]);
      return;
    }
    if (status.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterStatus.tr]);
      return;
    }
    if (name.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterName.tr]);
      return;
    }

    isSubmitLoading = true;
    update();

    LeadCreateModel leadModel = LeadCreateModel(
      source: source,
      status: status,
      name: name,
      assigned: assigned,
      clientId: clientId,
      tags: tags,
      contact: contact,
      title: title,
      email: email,
      website: website,
      phoneNumber: phoneNumber,
      company: company,
      address: address,
      city: city,
      state: state,
      country: country,
      defaultLanguage: defaultLanguage,
      description: description,
      customContactDate: customContactDate,
      contactedToday: contactedToday,
      isPublic: isPublic,
    );

    ResponseModel responseModel = await leadRepo.createLead(leadModel);
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
    sourceController.text = '';
    statusController.text = '';
    nameController.text = '';
    assignedController.text = '';
    clientIdController.text = '';
    tagsController.text = '';
    contactController.text = '';
    titleController.text = '';
    emailController.text = '';
    websiteController.text = '';
    phoneNumberController.text = '';
    companyController.text = '';
    addressController.text = '';
    cityController.text = '';
    stateController.text = '';
    countryController.text = '';
    defaultLanguageController.text = '';
    descriptionController.text = '';
    customContactDateController.text = '';
    contactedTodayController.text = '';
    isPublicController.text = '';
  }
}
