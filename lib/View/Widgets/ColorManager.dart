import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.code('#091140');
  static Color light = HexColor.code('#ffffff');
  static Color green = HexColor.code('#29c116');
  static Color lightBlue = HexColor.code('#868bae');
  static Color transPrimary = HexColor.code('#1b2153');
  static Color warning = HexColor.code('#f0ad4e');
}

extension HexColor on Color {
  static Color code(String hexCode) {
    hexCode = hexCode.replaceAll('#', '');
    if (hexCode.length == 6) hexCode = 'FF$hexCode';
    return Color(int.parse(hexCode, radix: 16));
  }
}
