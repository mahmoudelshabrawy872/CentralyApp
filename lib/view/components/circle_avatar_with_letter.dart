import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CircleAvatarWithInitialLetter extends StatelessWidget {
  const CircleAvatarWithInitialLetter({super.key, required this.initialLetter});
  final String initialLetter;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: Dimensions.space25,
      backgroundColor: ColorResources.blueGreyColor,
      child: Text(
        initialLetter.isNotEmpty ? initialLetter[0].toUpperCase() : '',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Theme.of(context).cardColor),
      ),
    );
  }
}
