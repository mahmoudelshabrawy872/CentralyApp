import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB(
      {super.key,
      this.isShowIcon = true,
      required this.press,
      this.isShowText = true,
      this.text = '',
      this.icon = Icons.add});
  final String text;
  final IconData icon;
  final bool isShowText;
  final bool isShowIcon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return isShowText && isShowIcon
        ? FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(icon),
            label: Text(text),
            onPressed: press)
        : !isShowIcon
            ? FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                label: Text(text),
                onPressed: press)
            : FloatingActionButton(
                onPressed: press,
                shape: const CircleBorder(),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              );
  }
}
