import 'package:flutex_admin/core/utils/util.dart';
import 'package:flutex_admin/data/controller/common/theme_controller.dart';
import 'package:flutex_admin/data/controller/localization/localization_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/core/utils/images.dart';
import 'package:flutex_admin/data/controller/splash/splash_controller.dart';
import 'package:flutex_admin/data/services/api_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    ThemeController themeController =
        ThemeController(sharedPreferences: Get.find());
    MyUtils.splashScreenUtils(themeController.darkTheme);
    Get.put(LocalizationController(sharedPreferences: Get.find()));
    final controller = Get.put(SplashController(
        apiClient: Get.find(), localizationController: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.gotoNextPage();
    });
  }

  @override
  void dispose() {
    ThemeController themeController =
        ThemeController(sharedPreferences: Get.find());
    MyUtils.allScreensUtils(themeController.darkTheme);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SplashController>(
        builder: (controller) => Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Center(
            child: Image.asset(MyImages.appLogo, height: 60),
          ),
        ),
      ),
    );
  }
}
