import 'dart:async';
import 'dart:convert';
import 'package:flutex_admin/core/route/route.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/model/home/home_response_model.dart';
import 'package:flutex_admin/data/repo/home/home_repo.dart';

class HomeController extends GetxController {
  HomeRepo homeRepo;
  HomeController({required this.homeRepo});

  bool isLoading = true;
  bool logoutLoading = false;
  HomeResponseModel homeModel = HomeResponseModel();

  Future<void> initialData({bool shouldLoad = true}) async {
    isLoading = shouldLoad ? true : false;
    update();

    await loadData();
    isLoading = false;
    update();
  }

  Future<dynamic> loadData() async {
    ResponseModel responseModel = await homeRepo.getData();
    if (responseModel.statusCode == 200) {
      homeModel =
          HomeResponseModel.fromJson(jsonDecode(responseModel.responseJson));
    } else {
      CustomSnackBar.error(errorList: [responseModel.message.tr]);
    }
    isLoading = false;
    update();
  }

  Future<void> logout() async {
    logoutLoading = true;
    update();

    await homeRepo.logout();
    CustomSnackBar.success(successList: [LocalStrings.logoutSuccessMsg.tr]);

    logoutLoading = false;
    update();
    Get.offAllNamed(RouteHelper.loginScreen);
  }
}
