import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.bgColor = kLightBackgroundColor,
    this.textColor = kTextColor,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0),
  });

  final Color bgColor;
  final Color textColor;
  final void Function() onPressed;
  final EdgeInsetsGeometry padding;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(40.0),
      color: bgColor,
    );

    return Container(
      width: 40.0,
      height: 40.0,
      decoration: boxDecoration,
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: icon,
      ),
    );
  }
}
