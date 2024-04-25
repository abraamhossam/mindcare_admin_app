import 'package:flutter/material.dart';

class SizeConfig {
  static double? height;
  static double? width;

  void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
