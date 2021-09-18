import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static const primary = Color(0xFFF69050);
  static const secondary = Color(0xFFEE539D);

  static const MaterialColor primaryPalette =
      MaterialColor(0xFFF69050, <int, Color>{
    50: Color(0xFFFEF2EA),
    100: Color(0xFFFCDECB),
    200: Color(0xFFFBC8A8),
    300: Color(0xFFF9B185),
    400: Color(0xFFF7A16A),
    500: primary,
    600: Color(0xFFF58849),
    700: Color(0xFFF37D40),
    800: Color(0xFFF27337),
    900: Color(0xFFEF6127),
  });

  static const MaterialColor secondaryPalette =
      MaterialColor(0xFFEE539D, <int, Color>{
    50: Color(0xFFFDEAF3),
    100: Color(0xFFFACBE2),
    200: Color(0xFFF7A9CE),
    300: Color(0xFFF387BA),
    400: Color(0xFFF16DAC),
    500: secondary,
    600: Color(0xFFEC4C95),
    700: Color(0xFFE9428B),
    800: Color(0xFFE73981),
    900: Color(0xFFE2296F),
  });
}
