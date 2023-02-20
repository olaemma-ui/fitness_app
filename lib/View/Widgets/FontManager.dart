import 'package:flutter/material.dart';

class FontManager {
  static TextStyle heading1({required Color color}) {
    return TextStyle(color: color, fontSize: 50, fontWeight: FontWeight.bold, inherit: false);
  }

  static TextStyle heading2({required Color color}) {
    return TextStyle(color: color, fontSize: 30, fontWeight: FontWeight.w600, inherit: false);
  }

  static TextStyle subHeading({required Color color}) {
    return TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w500, inherit: false);
  }

  static TextStyle body1({required Color color}) {
    return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500, inherit: false);
  }
}
