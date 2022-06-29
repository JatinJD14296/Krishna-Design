import 'package:flutter/material.dart';
import 'package:krishna_design/common/widgets/buttons.dart';
import 'package:krishna_design/common/widgets/icon_and_images.dart';
import 'package:krishna_design/common/widgets/text_and_styles.dart';
import 'package:krishna_design/utils/colors.dart';
import 'package:krishna_design/utils/images.dart';
import 'package:krishna_design/utils/screen_utils.dart';
import 'package:krishna_design/utils/strings.dart';

Widget logoWidget = Center(
  child: Images.instance.assetImage(
    name: appLogo,
    height: Screen.screenHeight * 0.3,
  ),
);

Widget createAnAccount = Row(children: [createAccount]);
Widget createAccount = labels(
  text: txtCreateAnAccount,
  color: darkTextColor,
  fontWeight: FontWeight.w600,
  textAlign: TextAlign.start,
  maxLine: 2,
  size: 26.0,
);

Widget createAccountButton({required Function() onTap}) {
  return filledButton(
    label: txtCreateAccount,
    onTap: onTap,
    width: Screen.screenWidth * 0.8,
  );
}
