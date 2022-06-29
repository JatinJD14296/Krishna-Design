import 'package:flutter/material.dart';
import 'package:krishna_design/utils/colors.dart';
import 'package:krishna_design/utils/screen_utils.dart';

import 'icon_and_images.dart';
import 'text_and_styles.dart';

Widget submitButton({
  required String text,
  required Function() onPressed,
  Color textColor = iconTextColor,
  double height = 40,
  Color? backgroundColor,
  bool isBorder = false,
  Color bColor = disableIconColor,
  bool buttonLogo = false,
  double radius = 25.0,
  double width = 50,
  Widget? child,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      gradient: backgroundColor == null
          ? const LinearGradient(
              colors: gradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
          : null,
      color: backgroundColor,
      borderRadius: BorderRadius.circular(radius),
      border: isBorder
          ? Border.all(
              color: bColor,
              style: BorderStyle.solid,
            )
          : Border.all(color: transparent),
    ),
    child: InkWell(
      onTap: onPressed,
      child: Center(
        child: child ??
            labels(
              text: text,
              color: textColor,
              size: 14,
              fontWeight: FontWeight.w600,
            ),
      ),
    ),
  );
}

Widget iconButton({
  required IconData icon,
  required Function() onTap,
  Color iconColor = white,
  double size = 24.0,
}) {
  return IconButton(
    icon: icons(
      icon: icon,
      color: iconColor,
      size: size,
    ),
    onPressed: onTap,
  );
}

Widget filledButton({
  required String label,
  required Function() onTap,
  double? width,
  Widget? child,
}) {
  return submitButton(
    text: label,
    height: Screen.screenHeight * 0.045,
    width: width ?? Screen.screenWidth * 0.27,
    onPressed: onTap,
    textColor: white,
    child: child,
  );
}

Widget borderButton({
  required String label,
  required Function() onTap,
  double? width,
}) {
  return submitButton(
    text: label,
    height: Screen.screenHeight * 0.045,
    width: width ?? Screen.screenWidth * 0.27,
    onPressed: onTap,
    textColor: loginColor,
    backgroundColor: white,
    bColor: loginColor,
    isBorder: true,
  );
}

Widget textButton({
  required String text,
  required Function() onTap,
}) {
  return TextButton(
    onPressed: onTap,
    child: labels(
      text: text,
      color: loginColor,
      size: 14.0,
      fontWeight: FontWeight.w600,
    ),
  );
}
