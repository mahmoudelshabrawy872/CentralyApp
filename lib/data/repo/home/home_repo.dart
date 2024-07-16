import 'package:flutex_admin/core/helper/shared_preference_helper.dart';
import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/core/utils/url_container.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:requests_plus/requests_plus.dart';

class HomeRepo {
  ApiClient apiClient;
  HomeRepo({required this.apiClient});

  Future<ResponseModel> getData() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.dashboardUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passCookies: true);
    return responseModel;
  }

  Future<void> logout() async {
    await RequestsPlus.clearStoredCookies(UrlContainer.baseUrl);
    await apiClient.sharedPreferences
        .setString(SharedPreferenceHelper.accessTokenKey, '');
    await apiClient.sharedPreferences
        .setString(SharedPreferenceHelper.accessSessionKey, '');
    await apiClient.sharedPreferences
        .setBool(SharedPreferenceHelper.rememberMeKey, false);
    return Future.value();
  }
}
