import 'package:chatform/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInfoTile extends StatelessWidget {
  final String title;
  final String? value;

  const AppInfoTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: value == null || value!.isEmpty
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryPalette.shade900,
          ),
        ),
        Text(
          value == null || value!.isEmpty ? '-' : value!.toUpperCase(),
          style: GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Get.textTheme.headline6?.color ?? Colors.white
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
