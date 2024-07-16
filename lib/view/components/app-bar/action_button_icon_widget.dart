import 'package:flutter/material.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';

class ActionButtonIconWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback pressed;
  final double size;
  final double spacing;
  final IconData? icon;
  final bool isImage;
  final String? imageSrc;
  final bool isLoading;

  const ActionButtonIconWidget({
    super.key,
    this.backgroundColor = ColorResources.colorWhite,
    this.iconColor = ColorResources.primaryColor,
    required this.pressed,
    this.size = 30,
    this.spacing = 10,
    this.icon,
    this.imageSrc,
    this.isImage = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        padding: EdgeInsets.all(isLoading ? 5 : 0),
        margin: EdgeInsetsDirectional.only(end: spacing),
        //decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
        child: isLoading
            ? SizedBox(
                height: size / 2,
                width: size / 2,
                child: const CircularProgressIndicator(
                    color: ColorResources.primaryColor))
            : isImage
                ? Image.asset(imageSrc!,
                    color: iconColor, height: size / 1.60, width: size / 1.60)
                : Icon(icon, color: iconColor, size: size / 1.60),
      ),
    );
  }
}
