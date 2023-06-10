import 'package:flutter/material.dart';

class SizeConfig {
  static double height = 0;
  static double width = 0;
  static double text = 0;

  static void getSize(context) {
    height = MediaQuery.of(context).size.height;
    text = MediaQuery.of(context).size.width * 0.01;
    width = MediaQuery.of(context).size.width;
  }
}
