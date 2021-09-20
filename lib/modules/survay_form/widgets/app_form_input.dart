import 'dart:ui';

import 'package:chatform/shared/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../survey_controller.dart';

class AppFormInput extends StatelessWidget {
  AppFormInput({Key? key}) : super(key: key);
  final controller = SurveyController.to;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Obx(() {
        return TextFormField(
          focusNode: controller.messageFocusNode,
          textInputAction: TextInputAction.done,
          textCapitalization: controller.step != 3
              ? TextCapitalization.words
              : TextCapitalization.none,
          controller: controller.messageController,
          validator: controller.step == 1 || controller.step == 2
              ? controller.requiredFieldValidator
              : controller.dateValidator,
          keyboardType:
              controller.step == 3 ? TextInputType.number : TextInputType.text,
          inputFormatters: controller.step == 3
              ? [
                  MaskTextInputFormatter(
                    mask: '##/##/####',
                    filter: {"#": RegExp(r'[0-9]')},
                  )
                ]
              : null,
          onChanged: controller.onMessageChange,
          decoration: InputDecoration(
              hintText: controller.step == 1
                  ? 'Digite seu nome'
                  : controller.step == 2
                      ? 'Digite sua cidade e estado'
                      : 'Nascimento: apenas os números',
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              hintStyle: GoogleFonts.inter(
                color: AppColors.secondaryPalette.shade400,
                fontWeight: FontWeight.w500,
              ),
              errorStyle: GoogleFonts.roboto(
                color: Get.theme.errorColor,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  width: 2,
                  color: AppColors.secondaryPalette.shade500,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  width: 2,
                  color: Get.theme.errorColor,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  width: 2,
                  color: Get.theme.errorColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  width: 2,
                  color: AppColors.secondaryPalette.shade500,
                ),
              ),
              fillColor: AppColors.primaryPalette.shade500),
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryPalette.shade900,
          ),
        );
      }),
    );
  }
}
