import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BrandStyleConfig {
  //COLORS
  static const Color lightPrimary = Color(0xfff2e2ec);
  static const Color primary = Color(0xffFF8900);
  static final Color offPrimary = const Color(0xff8D005F).withOpacity(0.15);

  // Static const Color secondary = Color(0xff416AC4);
  static const Color secondary = Color(0xff162D4F);
  static const Color offSecondary = Color(0xffC1DBF4);

  //COLOR SCHEME
  static  ColorScheme colorScheme =  ColorScheme.fromSeed(
      primary: BrandStyleConfig.primary,
      surface: const Color(0xffFF8900),
      secondary: Colors.black,
      tertiary: const Color(0xff484A51),
      seedColor: Colors.red,
  );

  //Elevated Text Theme
  static final TextTheme textTheme = TextTheme(
    //HEADLINE
    displayLarge: TextStyle(fontSize: 57.sp),
    displayMedium: TextStyle(fontSize: 45.sp),
    displaySmall: TextStyle(fontSize: 36.sp),
    headlineLarge: TextStyle(fontSize: 32.sp),
    headlineMedium: TextStyle(fontSize: 28.sp),
    headlineSmall: TextStyle(fontSize: 24.sp),

    //BODY
    bodyLarge: TextStyle(fontSize: 18.sp),
    bodyMedium: TextStyle(fontSize: 16.sp),
    bodySmall: TextStyle(fontSize: 14.sp),

    //LABEL
    labelLarge: TextStyle(fontSize: 16.sp),
    labelMedium: TextStyle(fontSize: 15.sp),
    labelSmall: TextStyle(fontSize: 13.sp),

    //TITLE
    titleLarge: TextStyle(fontSize: 22.sp),
    titleMedium: TextStyle(fontSize: 16.sp),
    titleSmall: TextStyle(fontSize: 14.sp),

    //custom size
  );

  //Elevated Button Theme
  static final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
          style: ButtonStyle(
    elevation: const MaterialStatePropertyAll<double>(1),
    textStyle: MaterialStatePropertyAll<TextStyle>(
        textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
    minimumSize: const MaterialStatePropertyAll<Size>(Size(100, 50)),
    // maximumSize: const MaterialStatePropertyAll<Size>(Size(300, 50)),
    backgroundColor: const MaterialStatePropertyAll<Color>(primary),
  ));
}
