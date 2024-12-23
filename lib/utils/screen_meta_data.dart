import 'package:flutter/material.dart';

class ScreenMetaData {
  static double getWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;
  static double getHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
}