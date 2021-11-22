import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  ),
  scaffoldBackgroundColor: AppColors.background,
);
