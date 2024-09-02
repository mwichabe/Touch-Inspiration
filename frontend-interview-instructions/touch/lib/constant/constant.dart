// ignore_for_file: unrelated_type_equality_checks, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

const defaultRadius = 12.0;
const defaultPadding = 15.0;

ColorThemes(BuildContext context) {
  Theme.of(context);
}

TextThemes(BuildContext context) {
  Theme.of(context).textTheme;
}

///
/* 
Color backgroundColor = Colors.white;
var foregroundColor =
    backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
 */
///

Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}

class ConstanceData {
  static String bseImageUrl = 'assets/images/';
  static String splashBg = bseImageUrl + "background.jpg";
  static String logo = bseImageUrl + "logo.png";

  ////////////////////////////////////////////
  static String bseIconUrl = 'assets/icons/';
  //static String bseJsonUrl = "assets/jsonImage/";
}
