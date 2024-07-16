import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/view/components/indicator/indicator.dart';

class CustomLoader extends StatelessWidget {
  final bool isFullScreen;
  final bool isPagination;
  final double strokeWidth;
  final Color loaderColor;

  const CustomLoader({
    super.key,
    this.isFullScreen = false,
    this.isPagination = false,
    this.strokeWidth = 1,
    this.loaderColor = ColorResources.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return isFullScreen
        ? SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: SpinKitFadingFour(
              color: loaderColor,
              size: 50.0,
            )),
          )
        : isPagination
            ? Center(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: LoadingIndicator(
                      strokeWidth: strokeWidth,
                    )))
            : Center(
                child: SpinKitFadingFour(
                color: loaderColor,
                size: 50.0,
              ));
  }
}
