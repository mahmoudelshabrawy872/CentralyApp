import 'package:flutter/material.dart';

class ChartDataModel {
  ChartDataModel({
    this.x,
    this.y,
    this.xValue,
    this.yValue,
    this.pointColor,
  });
  final dynamic x;
  final num? y;
  final dynamic xValue;
  final num? yValue;
  final Color? pointColor;
}
