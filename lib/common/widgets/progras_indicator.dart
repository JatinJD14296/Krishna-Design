import 'package:flutter/material.dart';
import 'package:krishna_design/utils/colors.dart';
import 'package:krishna_design/utils/screen_utils.dart';

const Widget circularIndicator = Center(child: CircularProgressIndicator());
Widget fullScreenCircularIndicator = Container(
  height: Screen.screenHeight,
  width: Screen.screenWidth,
  color: black12,
  child: const Center(
    child: CircularProgressIndicator(color: white),
  ),
);
