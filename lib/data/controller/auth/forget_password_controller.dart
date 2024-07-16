import 'package:flutex_admin/core/route/route.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/data/repo/auth/login_repo.dart';
import 'package:flutex_admin/view/components/snack_bar/show_custom_snackbar.dart';

class ForgetPasswordController extends GetxController {
  LoginRepo loginRepo;

  ForgetPasswordController({required this.loginRepo});

  bool submitLoading = false;
  TextEditingController emailController = TextEditingController();

  void submitForgetPassword() async {
    String email = emailController.text;

    if (email.isEmpty) {
      CustomSnackBar.error(errorList: [LocalStrings.enterEmail]);
      return;
    }

    submitLoading = true;
    update();
    String responseEmail = await loginRepo.forgetPassword(email);
    if (responseEmail.isNotEmpty) {
      emailController.text = '';
      Get.toNamed(RouteHelper.loginScreen);
    }

    submitLoading = false;
    update();
  }
}
