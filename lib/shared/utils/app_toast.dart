import 'package:chatform/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppToast {
  static toast({
    required String message,
    bool error = false,
  }) {
    Get.snackbar(
      error ? 'Erro' : 'Chatnilson',
      message,
      borderColor: AppColors.primaryPalette.shade500,
      borderWidth: 1,
      backgroundColor: error ? Colors.red : Colors.white,
      forwardAnimationCurve: Curves.bounceInOut,
      margin: const EdgeInsets.all(
        16,
      ),
      titleText: Container(),
      messageText: Row(
        children: [
          Text(
            message.toUpperCase(),
            style: GoogleFonts.roboto(
              color: error ? Colors.white : AppColors.primaryPalette.shade500,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
  }
}
