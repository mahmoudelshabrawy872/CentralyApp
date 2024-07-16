import 'dart:async';
import 'dart:convert';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/data/model/authorization/authorization_response_model.dart';
import 'package:flutex_admin/data/model/customer/customer_model.dart';
import 'package:flutex_admin/data/model/estimate/estimate_model.dart';
import 'package:flutex_admin/data/model/invoice/invoice_model.dart';
import 'package:flutex_admin/data/model/project/project_details_model.dart';
import 'package:flutex_admin/data/model/project/project_model.dart';
import 'package:flutex_admin/data/model/project/project_post_model.dart';
import 'package:flutex_admin/data/model/task/task_create_model.dart';
import 'package:flutex_admin/data/repo/project/project_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/view/components/snack_bar/show_custom_snackbar.dart';

class ProjectController extends GetxController {
  ProjectRepo projectRepo;
  ProjectController({required this.projectRepo});

  bool isLoading = true;
  bool submitLoading = false;
  bool projectOverviewEnable = true;
  bool projectTasksEnable = true;
  bool projectDiscussionsEnable = true;
  bool projectInvoicesEnable = true;
  bool projectProposalsEnable = true;
  bool projectEstimatesEnable = true;
  bool createTaskEnable = true;
  bool editTaskEnable = true;
  ProjectsModel projectsModel = ProjectsModel();
  ProjectDetailsModel projectDetailsModel = ProjectDetailsModel();
  InvoicesModel invoicesModel = InvoicesModel();
  EstimatesModel estimatesModel = EstimatesModel();
  TaskCreateModel taskCreateModel = TaskCreateModel();
  CustomersModel customersModel = CustomersModel();

  //List<String> relTypes = ["lead", "customer", "internal"];

  final Map<String, String> billingType = {
    '1': LocalStrings.fixedRate.tr,
    '2': LocalStrings.projectHours.tr,
    '3': LocalStrings.taskHours.tr,
  };

  final Map<String, String> projectStatus = {
    '1': LocalStrings.notStarted.tr,
    '2': LocalStrings.inProgress.tr,
    '3': LocalStrings.onHold.tr,
    '4': LocalStrings.finished.tr,
    '5': LocalStrings.cancelled.tr,
  };

  Future<void> initialData({bool shouldLoad = true}) async {
    isLoading = shouldLoad ? true : false;
    update();

    await loadProjects();
    isLoading = false;
    update();
  }

  Future<void> loadProjects() async {
    ResponseModel responseModel = await projectRepo.getAllProjects();
    projectsModel =
        ProjectsModel.fromJson(jsonDecode(responseModel.responseJson));

    isLoading = false;
    update();
  }

  Future<void> loadProjectDetails(projectId) async {
    ResponseModel responseModel =
        await projectRepo.getProjectDetails(projectId);
    if (responseModel.statusCode == 200) {
      projectDetailsModel =
          ProjectDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
    } else {
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isLoading = false;
    update();
  }

  Future<void> loadProjectCreateData() async {
    ResponseModel customersResponseModel = await projectRepo.getAllCustomers();
    customersModel = CustomersModel.fromJson(
        jsonDecode(customersResponseModel.responseJson));
    isLoading = false;
    update();
  }

  TextEditingController contentController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController clientIdController = TextEditingController();
  TextEditingController billingTypeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController progressFromTasksController = TextEditingController();
  TextEditingController projectCostController = TextEditingController();
  TextEditingController progressController = TextEditingController();
  TextEditingController projectRatePerHourController = TextEditingController();
  TextEditingController estimatedHoursController = TextEditingController();
  TextEditingController projectMembersController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode clientIdFocusNode = FocusNode();
  FocusNode billingTypeFocusNode = FocusNode();
  FocusNode startDateFocusNode = FocusNode();
  FocusNode statusFocusNode = FocusNode();
  FocusNode progressFromTasksFocusNode = FocusNode();
  FocusNode projectCostFocusNode = FocusNode();
  FocusNode progressFocusNode = FocusNode();
  FocusNode projectRatePerHourFocusNode = FocusNode();
  FocusNode estimatedHoursFocusNode = FocusNode();
  FocusNode projectMembersFocusNode = FocusNode();
  FocusNode deadlineFocusNode = FocusNode();
  FocusNode tagsFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();

  Future<void> submitProject(BuildContext context) async {
    String name = nameController.text.toString();
    String relType = '';
    String clientId = clientIdController.text.toString();
    String billingType = billingTypeController.text.toString();
    String startDate = startDateController.text.toString();
    String status = statusController.text.toString();
    String progressFromTasks = progressFromTasksController.text.toString();
    String projectCost = projectCostController.text.toString();
    String progress = progressController.text.toString();
    String projectRatePerHour = projectRatePerHourController.text.toString();
    String estimatedHours = estimatedHoursController.text.toString();
    String projectMembers = projectMembersController.text.toString();
    String deadline = deadlineController.text.toString();
    String tags = tagsController.text.toString();
    String description = descriptionController.text.toString();

    if (name.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterSubject.tr]);
      return;
    }
    if (billingType.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.billingType.tr]);
      return;
    }
    if (clientId.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.customer.tr]);
      return;
    }

    submitLoading = true;
    update();

    ProjectPostModel projectModel = ProjectPostModel(
      name: name,
      relType: relType,
      clientId: clientId,
      billingType: billingType,
      startDate: startDate,
      status: status,
      progressFromTasks: progressFromTasks,
      projectCost: projectCost,
      progress: progress,
      projectRatePerHour: projectRatePerHour,
      estimatedHours: estimatedHours,
      projectMembers: projectMembers,
      deadline: deadline,
      tags: tags,
      description: description,
    );

    ResponseModel responseModel = await projectRepo.createProject(projectModel);
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

  void clearData() {
    isLoading = false;
    contentController.text = '';
    nameController.text = '';
    clientIdController.text = '';
    billingTypeController.text = '';
    startDateController.text = '';
    statusController.text = '';
    progressFromTasksController.text = '';
    projectCostController.text = '';
    progressController.text = '';
    projectRatePerHourController.text = '';
    estimatedHoursController.text = '';
    projectMembersController.text = '';
    deadlineController.text = '';
    tagsController.text = '';
    descriptionController.text = '';
  }
}
