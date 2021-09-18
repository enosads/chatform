import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primaryPalette,
      accentColor: AppColors.secondaryPalette,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
