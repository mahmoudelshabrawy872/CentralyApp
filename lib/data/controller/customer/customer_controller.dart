import 'dart:async';
import 'dart:convert';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/data/model/authorization/authorization_response_model.dart';
import 'package:flutex_admin/data/model/contact/contact_model.dart';
import 'package:flutex_admin/data/model/customer/contact_post_model.dart';
import 'package:flutex_admin/data/model/customer/customer_details.dart';
import 'package:flutex_admin/data/model/customer/customer_model.dart';
import 'package:flutex_admin/data/model/customer/customer_post_model.dart';
import 'package:flutex_admin/data/model/customer/groups_model.dart';
import 'package:flutex_admin/data/model/global/countries_model.dart';
import 'package:flutex_admin/data/repo/customer/customer_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/view/components/snack_bar/show_custom_snackbar.dart';

class CustomerController extends GetxController {
  CustomerRepo customerRepo;
  CustomerController({required this.customerRepo});

  bool isLoading = true;
  bool submitLoading = false;
  CustomersModel customersModel = CustomersModel();
  CustomerDetailsModel customerDetailsModel = CustomerDetailsModel();
  ContactsModel customerContactsModel = ContactsModel();
  GroupsModel groupsModel = GroupsModel();
  CountriesModel countriesModel = CountriesModel();

  Future<void> initialData({bool shouldLoad = true}) async {
    isLoading = shouldLoad ? true : false;
    update();

    await loadCustomers();
    isLoading = false;
    update();
  }

  Future<void> loadCustomers() async {
    ResponseModel responseModel = await customerRepo.getAllCustomers();
    customersModel =
        CustomersModel.fromJson(jsonDecode(responseModel.responseJson));
    isLoading = false;
    update();
  }

  Future<void> loadCustomerDetails(customerId) async {
    ResponseModel responseModel =
        await customerRepo.getCustomerDetails(customerId);
    if (responseModel.statusCode == 200) {
      customerDetailsModel =
          CustomerDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
    } else {
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isLoading = false;
    update();
  }

  Future<void> loadCustomerCreateData() async {
    ResponseModel groupsResponseModel = await customerRepo.getCustomerGroups();
    groupsModel =
        GroupsModel.fromJson(jsonDecode(groupsResponseModel.responseJson));
    ResponseModel countriesResponseModel = await customerRepo.getCountries();
    countriesModel = CountriesModel.fromJson(
        jsonDecode(countriesResponseModel.responseJson));
    isLoading = false;
    update();
  }

  TextEditingController companyController = TextEditingController();
  TextEditingController vatController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  TextEditingController billingStreetController = TextEditingController();
  TextEditingController billingCityController = TextEditingController();
  TextEditingController billingStateController = TextEditingController();
  TextEditingController billingZipController = TextEditingController();
  TextEditingController billingCountryController = TextEditingController();
  TextEditingController shippingStreetController = TextEditingController();
  TextEditingController shippingCityController = TextEditingController();
  TextEditingController shippingStateController = TextEditingController();
  TextEditingController shippingZipController = TextEditingController();
  TextEditingController shippingCountryController = TextEditingController();

  FocusNode companyFocusNode = FocusNode();
  FocusNode vatFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode websiteFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode groupFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();
  FocusNode stateFocusNode = FocusNode();
  FocusNode zipFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();

  FocusNode billingStreetFocusNode = FocusNode();
  FocusNode billingCityFocusNode = FocusNode();
  FocusNode billingStateFocusNode = FocusNode();
  FocusNode billingZipFocusNode = FocusNode();
  FocusNode billingCountryFocusNode = FocusNode();
  FocusNode shippingStreetFocusNode = FocusNode();
  FocusNode shippingCityFocusNode = FocusNode();
  FocusNode shippingStateFocusNode = FocusNode();
  FocusNode shippingZipFocusNode = FocusNode();
  FocusNode shippingCountryFocusNode = FocusNode();

  Future<void> submitCustomer(BuildContext context) async {
    String company = companyController.text.toString();
    String vat = vatController.text.toString();
    String phoneNumber = phoneNumberController.text.toString();
    String website = websiteController.text.toString();
    String address = addressController.text.toString();
    String group = groupController.text.toString();
    String city = cityController.text.toString();
    String state = stateController.text.toString();
    String zip = zipController.text.toString();
    String country = countryController.text.toString();

    String billingStreet = billingStreetController.text.toString();
    String billingCity = billingCityController.text.toString();
    String billingState = billingStateController.text.toString();
    String billingZip = billingZipController.text.toString();
    String billingCountry = billingCountryController.text.toString();
    String shippingStreet = shippingStreetController.text.toString();
    String shippingCity = shippingCityController.text.toString();
    String shippingState = shippingStateController.text.toString();
    String shippingZip = shippingZipController.text.toString();
    String shippingCountry = shippingCountryController.text.toString();

    if (company.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterCompanyName.tr]);
      return;
    }

    submitLoading = true;
    update();

    CustomerPostModel customerModel = CustomerPostModel(
      company: company,
      vat: vat,
      phoneNumber: phoneNumber,
      website: website,
      address: address,
      groupsIn: group,
      city: city,
      state: state,
      zip: zip,
      country: country,
      billingStreet: billingStreet,
      billingCity: billingCity,
      billingState: billingState,
      billingZip: billingZip,
      billingCountry: billingCountry,
      shippingStreet: shippingStreet,
      shippingCity: shippingCity,
      shippingState: shippingState,
      shippingZip: shippingZip,
      shippingCountry: shippingCountry,
    );

    ResponseModel responseModel =
        await customerRepo.createCustomer(customerModel);
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

    submitLoading = false;
    update();
  }

  Future<void> loadCustomerContacts(customerId) async {
    ResponseModel responseModel =
        await customerRepo.getCustomerContacts(customerId);
    if (responseModel.statusCode == 200) {
      customerContactsModel =
          ContactsModel.fromJson(jsonDecode(responseModel.responseJson));
    } else {
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isLoading = false;
    update();
  }

  Future<void> loadContactCreateData() async {
    //ResponseModel customersResponseModel = await projectRepo.getAllCustomers();
    //customersModel = CustomersModel.fromJson(
    //    jsonDecode(customersResponseModel.responseJson));
    isLoading = false;
    update();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode titleFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  Future<void> submitContact(BuildContext context, String customerId) async {
    String firstName = firstNameController.text.toString();
    String lastName = lastNameController.text.toString();
    String email = emailController.text.toString();
    String title = titleController.text.toString();
    String phone = phoneController.text.toString();
    String password = passwordController.text.toString();

    if (firstName.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterSubject.tr]);
      return;
    }
    if (lastName.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.billingType.tr]);
      return;
    }
    if (email.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.customer.tr]);
      return;
    }

    submitLoading = true;
    update();

    ContactPostModel contactModel = ContactPostModel(
      customerId: customerId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      title: title,
      phone: phone,
      password: password,
    );

    ResponseModel responseModel =
        await customerRepo.createContact(contactModel);
    if (responseModel.statusCode == 200) {
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(
          jsonDecode(responseModel.responseJson));
      if (model.status!) {
        if (context.mounted) Navigator.pop(context);
        await loadCustomerDetails(customerId);
        CustomSnackBar.success(successList: [model.message!]);
      } else {
        CustomSnackBar.error(errorList: [model.message!]);
      }
    } else {
      CustomSnackBar.error(errorList: [responseModel.message]);
      return;
    }

    submitLoading = false;
    update();
  }

  void clearCustomerData() {
    isLoading = false;
    submitLoading = false;
    companyController.text = '';
    vatController.text = '';
    phoneNumberController.text = '';
    websiteController.text = '';
    addressController.text = '';
    billingStreetController.text = '';
    billingCityController.text = '';
    billingStateController.text = '';
    billingZipController.text = '';
    billingCountryController.text = '';
    shippingStreetController.text = '';
    shippingCityController.text = '';
    shippingStateController.text = '';
    shippingZipController.text = '';
    shippingCountryController.text = '';
  }

  void clearData() {
    isLoading = false;
    submitLoading = false;
    firstNameController.text = '';
    lastNameController.text = '';
    emailController.text = '';
    titleController.text = '';
    phoneController.text = '';
  }
}
