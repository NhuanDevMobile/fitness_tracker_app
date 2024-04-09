import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF4CAF50);
  static const primary2 = Color(0xFF00F0FF);
  static const secondary = Color(0xFFFF5722);
  static const grey = Color(0xFFACACAC);
  static const grey1 = Color(0xFF9DA8C3);
  static const grey2 = Color(0xFFF1F1F1);
  static const black = Color(0xFF020112);
  static const white = Color(0xFFFFFFFF);
  static const transparent = Colors.transparent;
  static const error = Color(0xFFF83758);
  static const purple = Color(0xFF3D60F4);
  static Color getColorBMI(double bmi) {
    if (bmi < 18.5) {
      return const Color(0xFF84CDEE);
    } else if (bmi >= 18.5 && bmi < 25) {
      return AppColors.primary;
    } else if (bmi >= 25 && bmi < 30) {
      return const Color(0xFFFFDF32);
    } else {
      return const Color(0xFFF5554A);
    }
  }
}
