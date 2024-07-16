import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/core/utils/url_container.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/model/lead/lead_create_model.dart';
import 'package:flutex_admin/data/services/api_service.dart';

class LeadRepo {
  ApiClient apiClient;
  LeadRepo({required this.apiClient});

  Future<ResponseModel> getAllLeads() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.leadsUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getLeadDetails(leadId) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.leadsUrl}/$leadId";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getLeadStatuses() async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.commonDataUrl}/leads_statuses";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getLeadSources() async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.commonDataUrl}/leads_sources";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> createLead(LeadCreateModel leadModel) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.leadsUrl}";

    Map<String, dynamic> params = {
      "source": leadModel.source,
      "status": leadModel.status,
      "name": leadModel.name,
      "assigned": leadModel.assigned,
      "client_id": leadModel.clientId,
      "tags": leadModel.tags,
      "contact": leadModel.contact,
      "title": leadModel.title,
      "email": leadModel.email,
      "website": leadModel.website,
      "phonenumber": leadModel.phoneNumber,
      "company": leadModel.company,
      "address": leadModel.address,
      "city": leadModel.city,
      "state": leadModel.state,
      "country": leadModel.country,
      "default_language": leadModel.defaultLanguage,
      "description": leadModel.description,
      "custom_contact_date": leadModel.customContactDate,
      "contacted_today": leadModel.contactedToday,
      "is_public": leadModel.isPublic,
    };

    ResponseModel responseModel = await apiClient
        .request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> deleteLead(leadId) async {
    String url =
        "${UrlContainer.baseUrl}delete/${UrlContainer.leadsUrl}/$leadId";
    ResponseModel responseModel = await apiClient
        .request(url, Method.deleteMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> searchLead(keysearch) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.leadsUrl}/search/$keysearch";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
