import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BrandStyleConfig {
  //COLORS
  static const Color primary = Color(0xffFF8900);

  //COLOR SCHEME
  static  ColorScheme colorScheme =  const ColorScheme.light(
      primary: BrandStyleConfig.primary,
      surface: Color(0xffFF8900),
      secondary: Colors.black,
      tertiary: Color(0xff484A51),
  );

  //Elevated Text Theme
  static final TextTheme textTheme = TextTheme(
    //BODY
    bodyLarge: TextStyle(fontSize: 18.sp),
    bodyMedium: TextStyle(fontSize: 16.sp),
    bodySmall: TextStyle(fontSize: 14.sp),

    //LABEL
    labelLarge: TextStyle(fontSize: 16.sp),
    labelMedium: TextStyle(fontSize: 15.sp),
    labelSmall: TextStyle(fontSize: 13.sp),


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
