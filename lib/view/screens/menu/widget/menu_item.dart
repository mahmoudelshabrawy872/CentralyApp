import 'package:flutex_admin/view/components/image/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/style.dart';

class MenuItems extends StatelessWidget {
  final String imageSrc;
  final String label;
  final VoidCallback onPressed;
  final bool isSvgImage;
  const MenuItems(
      {super.key,
      required this.imageSrc,
      required this.label,
      required this.onPressed,
      this.isSvgImage = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            vertical: Dimensions.space5, horizontal: Dimensions.space10),
        color: ColorResources.transparentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  //decoration: const BoxDecoration(color: ColorResources.screenBgColor, shape: BoxShape.circle),
                  child: isSvgImage
                      ? CustomSvgPicture(
                          image: imageSrc,
                          color: Theme.of(context).textTheme.bodyMedium!.color!,
                          height: 17.5,
                          width: 17.5)
                      : Image.asset(imageSrc,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                          height: 17.5,
                          width: 17.5),
                ),
                const SizedBox(width: Dimensions.space15),
                Text(label.tr,
                    style: regularDefault.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium!.color))
              ],
            ),
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: ColorResources.transparentColor,
                  shape: BoxShape.circle),
              child: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
            ),
          ],
        ),
      ),
    );
  }
}
