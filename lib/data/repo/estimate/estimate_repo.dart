import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/core/utils/url_container.dart';
import 'package:flutex_admin/data/model/estimate/estimate_post_model.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/services/api_service.dart';

class EstimateRepo {
  ApiClient apiClient;
  EstimateRepo({required this.apiClient});

  Future<ResponseModel> getAllEstimates() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.estimatesUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getEstimateDetails(estimateId) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.estimatesUrl}/$estimateId";
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

  Future<ResponseModel> getCurrencies() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.currenciesUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> createEstimate(EstimatePostModel estimateModel) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.estimatesUrl}";

    Map<String, dynamic> params = {
      "clientid": estimateModel.clientId,
      "number": estimateModel.number,
      "date": estimateModel.date,
      "currency": estimateModel.currency,
      "billing_street": estimateModel.billingStreet,
      "expirydate": estimateModel.duedate,
      "status": estimateModel.status,
      "clientnote": estimateModel.clientNote,
      "terms": estimateModel.terms,
      "newitems[0][description]": estimateModel.firstItemName,
      "newitems[0][long_description]": estimateModel.firstItemDescription,
      "newitems[0][qty]": estimateModel.firstItemQty,
      "newitems[0][rate]": estimateModel.firstItemRate,
      "newitems[0][unit]": estimateModel.firstItemUnit,
      "subtotal": estimateModel.subtotal,
      "total": estimateModel.total,
    };

    int i = 0;
    for (var estimate in estimateModel.newItems) {
      String estimateItemName = estimate.itemNameController.text;
      String estimateItemDescription = estimate.descriptionController.text;
      String estimateItemQty = estimate.qtyController.text;
      String estimateItemRate = estimate.rateController.text;
      String estimateItemUnit = estimate.unitController.text;

      if (estimateItemName.isNotEmpty && estimateItemRate.isNotEmpty) {
        i = i + 1;
        params['newitems[$i][description]'] = estimateItemName;
        params['newitems[$i][long_description]'] = estimateItemDescription;
        params['newitems[$i][qty]'] = estimateItemQty;
        params['newitems[$i][rate]'] = estimateItemRate;
        params['newitems[$i][unit]'] = estimateItemUnit;
        //params['newitems[$i][order]'] = '1';
        //params['newitems[0][taxname][]'] = 'CGST|9.00';
        //params['newitems[0][taxname][]'] = 'SGST|9.00';
      }
    }

    ResponseModel responseModel = await apiClient
        .request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> deleteEstimate(estimateId) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.estimatesUrl}/$estimateId";
    ResponseModel responseModel = await apiClient
        .request(url, Method.deleteMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> searchEstimate(keysearch) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.estimatesUrl}/search/$keysearch";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
