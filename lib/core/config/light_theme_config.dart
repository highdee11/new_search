import 'package:flutter/material.dart';
import 'brand_config.dart';

class ThemeConfig {

  static final ThemeData lightTheme = ThemeData(
    colorScheme: BrandStyleConfig.colorScheme,
    primaryColor: BrandStyleConfig.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: BrandStyleConfig.textTheme.apply(displayColor: Colors.black, bodyColor: Colors.black),
    elevatedButtonTheme: BrandStyleConfig.elevatedButtonThemeData,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),
  );
}