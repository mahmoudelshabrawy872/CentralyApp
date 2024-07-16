import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Converter {
  static String toCapitalized(String value) {
    return value.toLowerCase().capitalizeFirst ?? '';
  }

  static String roundDoubleAndRemoveTrailingZero(String value) {
    try {
      double number = double.parse(value);
      String b = number.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '');
      return b;
    } catch (e) {
      return value;
    }
  }

  static String projectStatusString(String state) {
    String status = '';
    switch (state) {
      case '1':
        status = LocalStrings.notStarted.tr;
        break;
      case '2':
        status = LocalStrings.inProgress.tr;
        break;
      case '3':
        status = LocalStrings.onHold.tr;
        break;
      case '4':
        status = LocalStrings.finished.tr;
        break;
      case '5':
        status = LocalStrings.cancelled.tr;
        break;
    }
    return status;
  }

  static String invoiceStatusString(String state) {
    String status = '';
    switch (state) {
      case '1':
        status = LocalStrings.unpaid.tr;
        break;
      case '2':
        status = LocalStrings.paid.tr;
        break;
      case '3':
        status = LocalStrings.partialyPaid.tr;
        break;
      case '4':
        status = LocalStrings.overdue.tr;
        break;
      case '5':
        status = LocalStrings.cancelled.tr;
        break;
      case '6':
        status = LocalStrings.draft.tr;
        break;
    }
    return status;
  }

  static String estimateStatusString(String state) {
    String status = '';
    switch (state) {
      case '1':
        status = LocalStrings.draft.tr;
        break;
      case '2':
        status = LocalStrings.sent.tr;
        break;
      case '3':
        status = LocalStrings.declined.tr;
        break;
      case '4':
        status = LocalStrings.accepted.tr;
        break;
      case '5':
        status = LocalStrings.expired.tr;
        break;
    }
    return status;
  }

  static String proposalStatusString(String state) {
    String status = '';
    switch (state) {
      case '1':
        status = LocalStrings.open.tr;
        break;
      case '2':
        status = LocalStrings.declined.tr;
        break;
      case '3':
        status = LocalStrings.accepted.tr;
        break;
      case '4':
        status = LocalStrings.sent.tr;
        break;
      case '5':
        status = LocalStrings.revised.tr;
        break;
      case '6':
        status = LocalStrings.draft.tr;
        break;
    }
    return status;
  }

  static String formatNumber(String value, {int precision = 2}) {
    try {
      double number = double.parse(value);
      String b = number.toStringAsFixed(precision);
      return b;
    } catch (e) {
      return value;
    }
  }

  static Color hexStringToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static String removeQuotationAndSpecialCharacterFromString(String value) {
    try {
      String formatedString =
          value.replaceAll('"', '').replaceAll('[', '').replaceAll(']', '');
      return formatedString;
    } catch (e) {
      return value;
    }
  }

  static String replaceUnderscoreWithSpace(String value) {
    try {
      String formatedString = value.replaceAll('_', ' ');
      String v =
          formatedString.split(" ").map((str) => str.capitalize).join(" ");
      return v;
    } catch (e) {
      return value;
    }
  }

  static String getFormatedDateWithStatus(String inputValue) {
    String value = inputValue;
    try {
      var list = inputValue.split(' ');
      var dateSection = list[0].split('-');
      var timeSection = list[1].split(':');
      int year = int.parse(dateSection[0]);
      int month = int.parse(dateSection[1]);
      int day = int.parse(dateSection[2]);
      int hour = int.parse(timeSection[0]);
      int minute = int.parse(timeSection[1]);
      int second = int.parse(timeSection[2]);
      final startTime = DateTime(year, month, day, hour, minute, second);
      final currentTime = DateTime.now();

      int dayDef = currentTime.difference(startTime).inDays;
      int hourDef = currentTime.difference(startTime).inHours;
      final minDef = currentTime.difference(startTime).inMinutes;
      final secondDef = currentTime.difference(startTime).inSeconds;

      if (dayDef == 0) {
        if (hourDef <= 0) {
          if (minDef <= 0) {
            value = '$secondDef ${"secondAgo".tr}';
          } else {
            value = '$hourDef ${"minutesAgo".tr}';
          }
        } else {
          value = '$hourDef ${"hourAgo".tr}';
        }
      } else {
        value = '$dayDef ${"daysAgo".tr}';
      }
    } catch (e) {
      value = inputValue;
    }

    return value;
  }

  static String getTrailingExtension(int number) {
    List<String> list = [
      'th',
      'st',
      'nd',
      'rd',
      'th',
      'th',
      'th',
      'th',
      'th',
      'th'
    ];
    if (((number % 100) >= 11) && ((number % 100) <= 13)) {
      return '${number}th';
    } else {
      int value = (number % 10).toInt();
      return '$number${list[value]}';
    }
  }

  static String addLeadingZero(String value) {
    return value.padLeft(2, '0');
  }

  static String sum(String first, String last, {int precision = 2}) {
    double firstNum = double.tryParse(first) ?? 0;
    double secondNum = double.tryParse(last) ?? 0;
    double result = firstNum + secondNum;
    String formatedResult =
        formatNumber(result.toString(), precision: precision);
    return formatedResult;
  }

  static String showPercent(String curSymbol, String s) {
    double value = 0;
    value = double.tryParse(s) ?? 0;
    if (value > 0) {
      return ' + $curSymbol$value';
    } else {
      return '';
    }
  }

  static mul(String first, String second) {
    double result =
        (double.tryParse(first) ?? 0) * (double.tryParse(second) ?? 0);
    return Converter.formatNumber(result.toString());
  }

  static calculateRate(String amount, String rate, {int precision = 2}) {
    double result =
        (double.tryParse(amount) ?? 0) / (double.tryParse(rate) ?? 0);
    return Converter.formatNumber(result.toString(), precision: precision);
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
