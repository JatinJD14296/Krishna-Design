import 'package:flutter/material.dart';
import 'package:krishna_design/common/widgets/buttons.dart';
import 'package:krishna_design/common/widgets/text_and_styles.dart';
import 'package:krishna_design/utils/colors.dart';

PreferredSizeWidget appbar(
  BuildContext context, {
  String title = '',
  IconData? leadingIcon,
  Widget? actionIcons,
  Color bgColor = primaryColor,
}) {
  return AppBar(
    title: labels(
      text: title.toUpperCase(),
      color: darkTextColor,
      fontWeight: FontWeight.bold,
      size: 25.0,
    ),
    leading: leadingIcon == null
        ? Container()
        : iconButton(
            icon: leadingIcon,iconColor: darkTextColor,
            onTap: () => Navigator.pop(context),
          ),
    actions: [actionIcons ?? Container()],
    backgroundColor: bgColor,
    centerTitle: true,
  );
}
