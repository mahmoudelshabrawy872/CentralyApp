import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/core/utils/url_container.dart';
import 'package:flutex_admin/data/model/contract/contract_post_model.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/services/api_service.dart';

class ContractRepo {
  ApiClient apiClient;
  ContractRepo({required this.apiClient});

  Future<ResponseModel> getAllContracts() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.contractsUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getContractDetails(contractId) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.contractsUrl}/$contractId";
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

  Future<ResponseModel> createContract(ContractPostModel contractModel) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.contractsUrl}";

    Map<String, dynamic> params = {
      "subject": contractModel.subject,
      "client": contractModel.client,
      "datestart": contractModel.startDate,
      "dateend": contractModel.endDate,
      "contract_value": contractModel.contractValue,
      "description": contractModel.description,
      "content": contractModel.content,
    };

    ResponseModel responseModel = await apiClient
        .request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> updateContract(ContractPostModel contractModel) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.contractsUrl}";

    Map<String, dynamic> params = {
      "subject": contractModel.subject,
      "datestart": contractModel.startDate,
      "client": contractModel.client,
      "dateend": contractModel.endDate,
      "contract_value": contractModel.contractValue,
      "description": contractModel.description,
      "content": contractModel.content,
    };

    ResponseModel responseModel = await apiClient
        .request(url, Method.putMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> deleteContract(contractId) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.contractsUrl}/$contractId";
    ResponseModel responseModel = await apiClient
        .request(url, Method.deleteMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> searchContract(keysearch) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.contractsUrl}/search/$keysearch";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
