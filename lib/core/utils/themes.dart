import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData light = ThemeData(
  primaryColor: ColorResources.primaryColor,
  secondaryHeaderColor: ColorResources.secondaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorResources.primaryColor,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    actionsIconTheme: IconThemeData(color: Colors.white),
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 23,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: ColorResources.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  fontFamily: 'Montserrat-Arabic',
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: ColorResources.lightBackgroundColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: ColorResources.primaryColor),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    contentPadding: const EdgeInsetsDirectional.only(top: 5, start: 20),
    hintStyle: const TextStyle(color: Colors.black),
    fillColor: ColorResources.inputColor,
  ),
  cardTheme: const CardTheme(color: Colors.white),
  cardColor: Colors.white,
  dataTableTheme: DataTableThemeData(
      headingRowColor:
          WidgetStateProperty.all<Color>(ColorResources.lightBlueGreyColor),
      dataRowColor: WidgetStateProperty.all<Color>(Colors.white)),
  drawerTheme: const DrawerThemeData(
      backgroundColor: ColorResources.colorWhite,
      surfaceTintColor: ColorResources.primaryColor),
  textTheme: const TextTheme(
      displaySmall: TextStyle(
          color: ColorResources.colorGrey,
          fontWeight: FontWeight.w400,
          fontSize: 16),
      bodyMedium: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
      bodySmall: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
      bodyLarge: TextStyle(
          color: ColorResources.primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 14)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      elevation: 5,
      type: BottomNavigationBarType.fixed),
  hintColor: ColorResources.hintColor,
  expansionTileTheme:
      const ExpansionTileThemeData(iconColor: ColorResources.colorGrey),
);

ThemeData dark = ThemeData(
  primaryColor: ColorResources.primaryColor,
  secondaryHeaderColor: ColorResources.secondaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorResources.primaryColor,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    actionsIconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 23,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: ColorResources.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  primarySwatch: Colors.red,
  scaffoldBackgroundColor: ColorResources.screenBgColorDark,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: ColorResources.secondaryColor),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    contentPadding: const EdgeInsetsDirectional.only(top: 5, start: 30),
    fillColor: ColorResources.inputColorDark,
    hintStyle: const TextStyle(color: Colors.white),
  ),
  cardTheme: const CardTheme(color: Colors.black),
  cardColor: ColorResources.cardColorDark,
  drawerTheme: const DrawerThemeData(
      backgroundColor: ColorResources.screenBgColorDark,
      surfaceTintColor: ColorResources.screenBgColorDark),
  textTheme: const TextTheme(
      displaySmall: TextStyle(
          color: ColorResources.colorGrey,
          fontWeight: FontWeight.w400,
          fontSize: 16),
      bodyMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
      bodySmall: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
      bodyLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14)),
  iconTheme: const IconThemeData(color: Colors.white),
  primaryIconTheme: const IconThemeData(color: Colors.white),
  hintColor: ColorResources.hintColorDark,
  expansionTileTheme: const ExpansionTileThemeData(iconColor: Colors.white),
);
