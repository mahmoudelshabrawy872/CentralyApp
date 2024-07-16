import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/core/utils/url_container.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/services/api_service.dart';

class ItemRepo {
  ApiClient apiClient;
  ItemRepo({required this.apiClient});

  Future<ResponseModel> getAllItems() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.itemsUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getItemDetails(itemId) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.itemsUrl}/$itemId";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
