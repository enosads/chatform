import 'package:chatform/modules/home/home_controller.dart';
import 'package:chatform/shared/theme/app_colors.dart';
import 'package:chatform/shared/widgets/app_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/survey_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pesquisas',
        ),
        flexibleSpace: const AppGradientContainer(),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.fetchAllSurveys,
          child: Stack(
            children: [
              ListView.separated(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 80,
                ),
                itemBuilder: (context, index) => SurveyCard(
                  survey: controller.surveys.reversed.toList()[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemCount: controller.surveys.length,
              ),
              Obx(
                () => controller.loading
                    ? Container(
                        color:
                            Colors.white,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.handleOpenSurveyForm,
        child: const AppGradientContainer(
          child: Icon(Icons.add),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
