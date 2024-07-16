import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/core/utils/url_container.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/model/ticket/ticket_create_model.dart';
import 'package:flutex_admin/data/services/api_service.dart';

class TicketRepo {
  ApiClient apiClient;
  TicketRepo({required this.apiClient});

  Future<ResponseModel> getAllTickets() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.ticketsUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getTicketDetails(ticketId) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.ticketsUrl}/$ticketId";
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

  Future<ResponseModel> getCustomerContacts(customerId) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.contactsUrl}/$customerId";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getTicketDepartments() async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.commonDataUrl}/ticket_departments";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getTicketPriorities() async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.commonDataUrl}/ticket_priorities";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getTicketServices() async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.commonDataUrl}/ticket_services";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> createTicket(TicketCreateModel ticketModel) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.ticketsUrl}";

    Map<String, dynamic> params = {
      "subject": ticketModel.subject,
      "department": ticketModel.department,
      "priority": ticketModel.priority,
      "service": ticketModel.service,
      "userid": ticketModel.userId,
      "contactid": ticketModel.contactId,
      "message": ticketModel.description,
    };

    ResponseModel responseModel = await apiClient
        .request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }
}
