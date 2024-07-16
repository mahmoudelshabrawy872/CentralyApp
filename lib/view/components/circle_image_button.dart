import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/utils/color_resources.dart';
import '../../core/utils/images.dart';
import 'image/custom_svg_picture.dart';

class CircleImageWidget extends StatelessWidget {
  final double height;
  final double width;
  final String imagePath;
  final bool isAsset;
  final VoidCallback? press;
  final double border;
  final bool isProfile;
  const CircleImageWidget(
      {super.key,
      this.isProfile = false,
      this.border = 0,
      this.height = 30,
      this.width = 30,
      this.isAsset = true,
      required this.imagePath,
      this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: border > 0
          ? ClipOval(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.transparentColor,
                  border:
                      Border.all(color: ColorResources.borderColor, width: 1),
                ),
                child: CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    width: height,
                    height: width,
                    errorWidget: (ctx, object, trx) {
                      return Image.asset(
                        isProfile
                            ? MyImages.profile
                            : MyImages.placeHolderImage,
                        fit: BoxFit.cover,
                        width: height,
                        height: width,
                      );
                    },
                    placeholder: (ctx, trx) {
                      return Image.asset(
                        isProfile
                            ? MyImages.profile
                            : MyImages.placeHolderImage,
                      );
                    }),
              ),
            )
          : imagePath.contains('svg')
              ? CustomSvgPicture(
                  image: imagePath,
                  fit: BoxFit.cover,
                  width: height,
                  height: width,
                )
              : ClipOval(
                  child: isAsset
                      ? Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: width,
                          height: height,
                        )
                      : ClipOval(
                          child: CachedNetworkImage(
                              imageUrl: imagePath,
                              fit: BoxFit.cover,
                              width: width,
                              height: height,
                              errorWidget: (ctx, object, trx) {
                                return Image.asset(
                                  isProfile
                                      ? MyImages.profile
                                      : MyImages.placeHolderImage,
                                  fit: BoxFit.cover,
                                  width: height,
                                  height: width,
                                );
                              },
                              placeholder: (ctx, trx) {
                                return Image.asset(
                                  isProfile
                                      ? MyImages.profile
                                      : MyImages.placeHolderImage,
                                );
                              }),
                        )),
    );
  }
}
