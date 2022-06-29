import 'package:flutter/material.dart';
import 'package:krishna_design/common/widgets/padding_margin.dart';
import 'package:krishna_design/common/widgets/space_and_dividers.dart';
import 'package:krishna_design/common/widgets/text_and_styles.dart';
import 'package:krishna_design/utils/colors.dart';
import 'package:krishna_design/utils/screen_utils.dart';

import 'icon_and_images.dart';

Widget listItem({String label = '', Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: Screen.screenHeight * 0.07,
      margin: paddingAll(10.0),
      decoration: circularBoxDecoration(
        gradient: const LinearGradient(colors: gradientColor),
        circularRadius: 10.0,
        border: Border.all(
          color: iconTextColor,
          width: 3,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: labels(
              text: label.toUpperCase(),
              color: darkTextColor,
            ),
          ),
          icons(icon: Icons.keyboard_arrow_right),
          horizontalSpace(20.0),
        ],
      ),
    ),
  );
}
