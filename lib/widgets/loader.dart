import 'package:dynamic_forms/constants/color.dart';
import 'package:flutter/material.dart';

Widget loader() {
  return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(ColorPalette.blackColor),);
}
