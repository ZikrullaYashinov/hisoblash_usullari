import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppTheme {
  static ThemeData light = ThemeData(
    fontFamily: "Inter",
    focusColor: Colors.white,
    backgroundColor: AppColors.lightBackground,
    hintColor: Colors.black,
  );
  static ThemeData dark = ThemeData(
    fontFamily: "Inter",
    focusColor: Colors.black,
    backgroundColor: AppColors.darkBackground,
    hintColor: Colors.white,
  );
}
