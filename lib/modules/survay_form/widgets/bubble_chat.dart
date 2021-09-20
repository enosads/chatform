import 'dart:ui';

import 'package:bubble/bubble.dart';
import 'package:chatform/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../survey_controller.dart';

enum ChatDirection { receiving, sending }

class BubbleChat extends StatelessWidget {
  final String Function() message;
  final ChatDirection direction;
  final int step;
  final controller = SurveyController.to;

  BubbleChat({
    Key? key,
    required this.message,
    required this.direction,
    required this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.step >= step
            ? Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (direction == ChatDirection.receiving)
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.contain,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    if (direction == ChatDirection.receiving)
                      const SizedBox(
                        width: 4,
                      ),
                    if (direction == ChatDirection.sending)
                      Expanded(
                        child: Container(),
                      ),
                    SizedBox(
                      width: direction == ChatDirection.sending
                          ? Get.width * 0.5
                          : Get.width - 84,
                      child: Bubble(
                        nip: direction == ChatDirection.receiving
                            ? BubbleNip.leftTop
                            : BubbleNip.rightTop,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message(),
                              style: GoogleFonts.inter(
                                color: direction == ChatDirection.receiving
                                    ? AppColors.secondaryPalette.shade900
                                    : AppColors.primaryPalette.shade900,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (step == 4 &&
                                direction == ChatDirection.receiving)
                              const SizedBox(
                                height: 8,
                              ),
                            if (step == 4 &&
                                direction == ChatDirection.receiving)
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.only(right: 0.5),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 10,
                                ),
                                onRatingUpdate: controller.handleUpdateRate,
                              )
                          ],
                        ),
                        nipOffset: 16.toDouble(),
                        nipWidth: 16,
                        nipHeight: 16,
                        color: direction == ChatDirection.receiving
                            ? Colors.white
                            : AppColors.primaryPalette.shade50,
                        padding: const BubbleEdges.all(16),
                      ),
                    ),
                    if (direction == ChatDirection.sending)
                      const SizedBox(
                        width: 4,
                      ),
                    if (direction == ChatDirection.sending)
                      Container(
                        width: 48,
                        height: 48,
                        child: const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryPalette.shade500,
                              AppColors.secondaryPalette.shade500,
                            ],
                            stops: const [0.5, 1.0],
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
