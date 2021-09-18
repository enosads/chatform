import 'package:chatform/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/survey_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Chat Style',
          style: GoogleFonts.inter(),
        ),
      ),
      body: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 80,
          ),
          itemBuilder: (context, index) => SurveyCard(
            survey: controller.surveys[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
          itemCount: controller.surveys.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.handleOpenSurveyForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
