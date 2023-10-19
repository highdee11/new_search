import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'brand_config.dart';

class ThemeConfig {


  static final ThemeData lightTheme = ThemeData(
    colorScheme: BrandStyleConfig.colorScheme,
    primaryColor: BrandStyleConfig.primary,
    scaffoldBackgroundColor: const Color(0xfffafafa),
    textTheme: BrandStyleConfig.textTheme.apply(displayColor: Colors.black, bodyColor: Colors.black),
    elevatedButtonTheme: BrandStyleConfig.elevatedButtonThemeData,
    primaryColorDark: Colors.black,
    brightness: Brightness.light,
    canvasColor: const Color(0xfff1f1f1),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),
  );
}