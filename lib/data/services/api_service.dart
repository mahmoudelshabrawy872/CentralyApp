import 'dart:convert';
import 'dart:io';

import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:requests_plus/requests_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutex_admin/core/helper/shared_preference_helper.dart';
import 'package:flutex_admin/core/route/route.dart';
import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/data/model/authorization/authorization_response_model.dart';

class ApiClient extends GetxService {
  SharedPreferences sharedPreferences;
  ApiClient({required this.sharedPreferences});

  Future<ResponseModel> request(
    String uri,
    String method,
    Map<String, dynamic>? params, {
    bool passHeader = false,
    bool passCookies = false,
    bool isOnlyAcceptType = false,
  }) async {
    http.Response response;

    try {
      if (method == Method.postMethod) {
        if (passHeader) {
          initToken();
          if (isOnlyAcceptType) {
            response = await RequestsPlus.post(uri, body: params, headers: {
              "Accept": "application/json",
            });
          } else {
            response = await RequestsPlus.post(uri, body: params, headers: {
              'authtoken': token,
            });
          }
        } else if (passCookies) {
          await RequestsPlus.get(uri);
          response = await RequestsPlus.post(uri, body: params);
        } else {
          response = await RequestsPlus.post(uri, body: params);
        }
      } else if (method == Method.putMethod) {
        if (passHeader) {
          initToken();
          response = await RequestsPlus.put(uri, body: params, headers: {
            'authtoken': token,
          });
        } else {
          response = await RequestsPlus.post(uri, body: params);
        }
      } else if (method == Method.deleteMethod) {
        response = await RequestsPlus.delete(uri);
      } else if (method == Method.updateMethod) {
        response = await RequestsPlus.patch(uri);
      } else {
        if (passHeader) {
          initToken();
          response = await RequestsPlus.get(uri, headers: {
            'authtoken': token,
          });
        } else if (passCookies) {
          initToken();
          await RequestsPlus.addCookie(uri, 'sp_session', session);
          response = await RequestsPlus.get(uri, headers: {
            'authtoken': token,
          });
        } else {
          response = await RequestsPlus.get(uri);
        }
      }

      if (kDebugMode) {
        print('url--------------${uri.toString()}');
        print('params-----------${params.toString()}');
        print('status-----------${response.statusCode}');
        print('body-------------${response.body.toString()}');
        print('token------------$token');
      }

      if (response.statusCode == 200) {
        try {
          AuthorizationResponseModel model =
              AuthorizationResponseModel.fromJson(jsonDecode(response.body));
          if (!model.status!) {
            sharedPreferences.setBool(
                SharedPreferenceHelper.rememberMeKey, false);
            sharedPreferences.remove(SharedPreferenceHelper.token);
            Get.offAllNamed(RouteHelper.loginScreen);
          }
        } catch (e) {
          e.toString();
        }
        return ResponseModel(true, 'Success', 200, response.body);
      } else if (response.statusCode == 401) {
        sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
        Get.offAllNamed(RouteHelper.loginScreen);
        return ResponseModel(
            false, LocalStrings.unAuthorized.tr, 401, response.body);
      } else if (response.statusCode == 404) {
        //TODO: //sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
        //Get.offAllNamed(RouteHelper.loginScreen);
        //return ResponseModel(false, LocalStrings.unAuthorized.tr, 404, response.body);
        return ResponseModel(
            false, LocalStrings.noDataFound.tr, 404, response.body);
      } else if (response.statusCode == 500) {
        return ResponseModel(
            false, LocalStrings.serverError.tr, 500, response.body);
      } else {
        return ResponseModel(
            false, LocalStrings.somethingWentWrong.tr, 499, response.body);
      }
    } on SocketException {
      return ResponseModel(false, LocalStrings.noInternet.tr, 503, '');
    } on FormatException {
      return ResponseModel(false, LocalStrings.badResponseMsg.tr, 400, '');
    } catch (e) {
      return ResponseModel(false, LocalStrings.somethingWentWrong.tr, 499, '');
    }
  }

  String token = '';

  String session = '';

  initToken() {
    if (sharedPreferences.containsKey(SharedPreferenceHelper.accessTokenKey) &&
        sharedPreferences
            .containsKey(SharedPreferenceHelper.accessSessionKey)) {
      String? t =
          sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey);
      token = t ?? '';
      String? s =
          sharedPreferences.getString(SharedPreferenceHelper.accessSessionKey);
      session = s ?? '';
    } else {
      token = '';
      session = '';
    }
  }
}
