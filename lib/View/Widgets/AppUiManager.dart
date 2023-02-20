import 'package:fitness_app/View/Widgets/ColorManager.dart';
import 'package:flutter/material.dart';

class AppUiManager{

  static ThemeData theme() {
    return ThemeData(
      primaryColor: ColorManager.primary,
    );
  }
}
