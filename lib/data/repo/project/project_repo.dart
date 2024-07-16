import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/core/utils/url_container.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/model/project/project_post_model.dart';
import 'package:flutex_admin/data/services/api_service.dart';

class ProjectRepo {
  ApiClient apiClient;
  ProjectRepo({required this.apiClient});

  Future<ResponseModel> getAllProjects() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.projectsUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getProjectDetails(projectId) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.projectsUrl}/$projectId";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getAllCustomers() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.customersUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> createProject(ProjectPostModel projectModel) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.projectsUrl}";

    Map<String, dynamic> params = {
      "name": projectModel.name,
      "rel_type": projectModel.relType,
      "clientid": projectModel.clientId,
      "billing_type": projectModel.billingType,
      "start_date": projectModel.startDate,
      "status": projectModel.status,
      "progress_from_tasks": projectModel.progressFromTasks,
      "project_cost": projectModel.projectCost,
      "progress": projectModel.progress,
      "project_rate_per_hour": projectModel.projectRatePerHour,
      "estimated_hours": projectModel.estimatedHours,
      "project_members": projectModel.projectMembers,
      "deadline": projectModel.deadline,
      "tags": projectModel.tags,
      "description": projectModel.description,
    };

    ResponseModel responseModel = await apiClient
        .request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> deleteProject(projectId) async {
    String url =
        "${UrlContainer.baseUrl}delete/${UrlContainer.projectsUrl}/$projectId";
    ResponseModel responseModel = await apiClient
        .request(url, Method.deleteMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> searchProject(keysearch) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.projectsUrl}/search/$keysearch";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
