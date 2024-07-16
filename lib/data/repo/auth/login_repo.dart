import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/core/utils/url_container.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/services/api_service.dart';

class LoginRepo {
  ApiClient apiClient;

  LoginRepo({required this.apiClient});

  Future<ResponseModel> loginUser(String email, String password) async {
    Map<String, String> map = {'email': email, 'password': password};
    String url = '${UrlContainer.baseUrl}${UrlContainer.loginUrl}';
    ResponseModel model = await apiClient.request(url, Method.postMethod, map,
        passHeader: false, passCookies: true);
    return model;
  }

  Future<String> forgetPassword(String email) async {
    //Map<String, String> map = {'email': email};
    //String url = '${UrlContainer.baseUrl}${UrlContainer.forgotPasswordUrl}';
    //final response = await apiClient.request(url, Method.postMethod, map,
    //    isOnlyAcceptType: true, passHeader: true);
    return '';
  }
}
