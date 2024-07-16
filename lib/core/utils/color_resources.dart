import 'package:flutex_admin/data/controller/common/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorResources {
  static const Color primaryColor = Color(0xff1e293b);
  static const Color secondaryColor = Color(0xff27B8DA);
  static const Color screenBgColor = Color(0xFFF9F9F9);
  static const Color screenBgColorDark = Color(0xFF171e29);
  static const Color cardColor = Color(0xffF6F7FE);
  static const Color cardColorDark = Color(0xff1c2739);
  static const Color hintColor = Color(0xFF92A5C6);
  static const Color hintColorDark = Color(0xFF92A5C6);
  static Color secondaryScreenBgColor = primaryColor.withOpacity(.4);
  static const Color primaryTextColor = Color(0xff262626);
  static const Color contentTextColor = Color(0xff777777);
  static const Color primaryStatusBarColor = primaryColor;
  static const Color underlineTextColor = primaryColor;
  static const Color lineColor = Color(0xffECECEC);
  static const Color borderColor = Color(0xffD9D9D9);
  static const Color inputColor = Color(0xffECECEC);
  static const Color inputColorDark = Color(0xff1F1F1F);

  // New
  static const Color lightBackgroundColor = Color(0xFFF5F6F9);
  static const Color darkColor = Color(0xFF202A44);
  static const Color textDarkColor = Color(0xFF444952);
  static const Color blueGreyColor = Color(0xFF92A5C6);
  static const Color lightBlueGreyColor = Color(0xFFDEE4ED);
  static const Color blueColor = Colors.blue;
  static const Color redColor = Colors.redAccent;
  static const Color greenColor = Colors.green;
  static const Color yellowColor = Colors.orange;
  static const Color purpleColor = Colors.purple;

  // app bar
  static const Color appBarColor = primaryColor;
  static const Color appBarContentColor = colorWhite;

  // text field
  static Color labelTextColor = colorBlack.withOpacity(0.6);
  static const Color textFieldDisableBorderColor = Color(0xffCFCEDB);
  static const Color textFieldEnableBorderColor = primaryColor;
  static const Color hintTextColor = Color(0xff98a1ab);

  // button
  static const Color primaryButtonColor = primaryColor;
  static const Color primaryButtonTextColor = colorWhite;
  static const Color secondaryButtonColor = colorWhite;
  static const Color secondaryButtonTextColor = colorBlack;

  // icon
  static const Color iconColor = Color(0xff555555);
  static const Color filterEnableIconColor = primaryColor;
  static const Color filterIconColor = iconColor;
  static const Color searchEnableIconColor = colorRed;
  static const Color searchIconColor = iconColor;
  static const Color bottomSheetCloseIconColor = colorBlack;

  static const Color colorWhite = Color(0xffFFFFFF);
  static const Color colorBlack = Color(0xff262626);
  static const Color colorGreen = Color(0xff28C76F);
  static const Color colorGreen100 = Color(0xffD4F4E2);
  static const Color colorOrange = Color(0xffFF9F43);
  static const Color colorOrange100 = Color(0xffFFECD9);
  static const Color colorRed = Color(0xffEA5455);
  static const Color colorRed100 = Color(0xffFCE9E9);
  static const Color colorGrey = Color(0xff555555);
  static const Color lightGray = Color(0xFFFAFAFA);
  static const Color colorlighterGrey = Color(0xFF7c8099);
  static const Color colorLightGrey = Color(0xFFCECECE);
  static const Color transparentColor = Colors.transparent;

  // screen-bg & primary color
  static Color getPrimaryColor() {
    return primaryColor;
  }

  static Color getScreenBgColor() {
    return Get.find<ThemeController>().darkTheme ? cardColorDark : cardColor;
  }

  static Color projectStatusColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case '1': // Not Started
        color = ColorResources.darkColor;
        break;
      case '2': // In Progress
        color = ColorResources.blueColor;
        break;
      case '3': // On Hold
        color = ColorResources.yellowColor;
        break;
      case '4': // Finished
        color = ColorResources.greenColor;
        break;
      case '5': // Cancelled
        color = ColorResources.redColor;
        break;
    }
    return color;
  }

  static Color taskStatusColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case '1':
        color = ColorResources.darkColor;
        break;
      case '2':
        color = ColorResources.blueColor;
        break;
      case '3':
        color = ColorResources.yellowColor;
        break;
      case '4':
        color = ColorResources.redColor;
        break;
      case '5':
        color = ColorResources.greenColor;
        break;
    }
    return color;
  }

  static Color invoiceStatusColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case '1': // Unpaid
        color = ColorResources.redColor;
        break;
      case '2': // Paid
        color = ColorResources.greenColor;
        break;
      case '3': // Partialy Paid
        color = ColorResources.colorOrange;
        break;
      case '4': // Overdue
        color = ColorResources.yellowColor;
        break;
      case '5': // Cancelled
        color = ColorResources.colorGrey;
        break;
      case '6': // Draft
        color = ColorResources.darkColor;
        break;
    }
    return color;
  }

  static Color invoiceTextStatusColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case 'Unpaid':
        color = ColorResources.redColor;
        break;
      case 'Paid':
        color = ColorResources.greenColor;
        break;
      case 'Partialy Paid':
        color = ColorResources.colorOrange;
        break;
      case 'Overdue':
        color = ColorResources.redColor;
        break;
      case 'Cancelled':
        color = ColorResources.redColor;
        break;
      case 'Draft':
        color = ColorResources.darkColor;
        break;
    }
    return color;
  }

  static Color contractStatusColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case '0':
        color = ColorResources.blueColor;
        break;
      case '1':
        color = ColorResources.greenColor;
        break;
      case '2':
        color = ColorResources.redColor;
        break;
      case '3':
        color = ColorResources.yellowColor;
        break;
      case '4':
        color = ColorResources.darkColor;
        break;
    }
    return color;
  }

  static Color estimateStatusColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case '1': //
        color = ColorResources.darkColor;
        break;
      case '2': //
        color = ColorResources.blueColor;
        break;
      case '3': //
        color = ColorResources.redColor;
        break;
      case '4': //
        color = ColorResources.greenColor;
        break;
      case '5': // Expired
        color = ColorResources.redColor;
        break;
    }
    return color;
  }

  static Color estimateTextStatusColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case 'Draft':
        color = ColorResources.darkColor;
        break;
      case 'Not Sent':
        color = ColorResources.blueColor;
        break;
      case 'Sent':
        color = ColorResources.redColor;
        break;
      case 'Expired':
        color = ColorResources.greenColor;
        break;
      case 'Declined':
        color = ColorResources.redColor;
        break;
      case 'Accepted':
        color = ColorResources.redColor;
        break;
    }
    return color;
  }

  static Color proposalTextStatusColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case 'Draft':
        color = ColorResources.darkColor;
        break;
      case 'Sent':
        color = ColorResources.blueColor;
        break;
      case 'Open':
        color = ColorResources.redColor;
        break;
      case 'Revised':
        color = ColorResources.greenColor;
        break;
      case 'Declined':
        color = ColorResources.redColor;
        break;
      case 'Accepted':
        color = ColorResources.greenColor;
        break;
    }
    return color;
  }

  static Color proposalStatusColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case '1': // Open
        color = ColorResources.blueColor;
        break;
      case '2': // Declined
        color = ColorResources.redColor;
        break;
      case '3': // Accepted
        color = ColorResources.greenColor;
        break;
      case '4': // Sent
        color = ColorResources.colorOrange;
        break;
      case '5': // Revised
        color = ColorResources.blueColor;
        break;
      case '6': // Draft
        color = ColorResources.colorGrey;
        break;
    }
    return color;
  }

  static Color ticketStatusColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case '1': // Open
        color = ColorResources.blueColor;
        break;
      case '2': // In Progress
        color = ColorResources.yellowColor;
        break;
      case '3': // Answered
        color = ColorResources.greenColor;
        break;
      case '4': // On Hold
        color = ColorResources.redColor;
        break;
      case '5': // Closed
        color = ColorResources.darkColor;
        break;
    }
    return color;
  }

  static Color ticketPriorityColor(String state) {
    Color color = ColorResources.blueColor;
    switch (state) {
      case '1': // Low
        color = ColorResources.greenColor;
        break;
      case '2': // Medium
        color = ColorResources.yellowColor;
        break;
      case '3': // High
        color = ColorResources.redColor;
        break;
    }
    return color;
  }

  static Color getGreyText() {
    return ColorResources.colorBlack.withOpacity(0.5);
  }

  static Color getSecondaryScreenBgColor() {
    return secondaryScreenBgColor;
  }

  // appbar color
  static Color getAppBarColor() {
    return appBarColor;
  }

  static Color getAppBarContentColor() {
    return appBarContentColor;
  }

  // text color
  static Color getHeadingTextColor() {
    return primaryTextColor;
  }

  static Color getContentTextColor() {
    return contentTextColor;
  }

  // text-field color
  static Color getLabelTextColor() {
    return labelTextColor;
  }

  static Color getHintTextColor() {
    return hintTextColor;
  }

  static Color getTextFieldDisableBorder() {
    return textFieldDisableBorderColor;
  }

  static Color getTextFieldEnableBorder() {
    return textFieldEnableBorderColor;
  }

  // button color
  static Color getPrimaryButtonColor() {
    return primaryButtonColor;
  }

  static Color getPrimaryButtonTextColor() {
    return primaryButtonTextColor;
  }

  static Color getSecondaryButtonColor() {
    return secondaryButtonColor;
  }

  static Color getSecondaryButtonTextColor() {
    return secondaryButtonTextColor;
  }

  // icon color
  static Color getIconColor() {
    return iconColor;
  }

  static Color getFilterDisableIconColor() {
    return filterIconColor;
  }

  static Color getFilterEnableIconColor() {
    return filterEnableIconColor;
  }

  static Color getSearchIconColor() {
    return searchIconColor;
  }

  static Color getSearchEnableIconColor() {
    return colorRed;
  }

  static Color getUnselectedIconColor() {
    return Get.find<ThemeController>().darkTheme
        ? colorWhite
        : colorGrey.withOpacity(0.6);
  }

  static Color getSelectedIconColor() {
    return Get.find<ThemeController>().darkTheme
        ? getTextColor()
        : getTextColor();
  }

  // transparent color
  static Color getTransparentColor() {
    return transparentColor;
  }

  // text color
  static Color getTextColor() {
    return colorBlack;
  }

  static Color getCardBgColor() {
    return colorWhite;
  }
}
