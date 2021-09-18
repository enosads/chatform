import 'package:chatform/modules/home/widgets/app_info_tile.dart';
import 'package:chatform/shared/data/models/survey_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyCard extends StatelessWidget {
  final Survey survey;

  const SurveyCard({Key? key, required this.survey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: Get.width,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              AppInfoTile(title: 'Nome', value: survey.name),
              AppInfoTile(title: 'Cidade', value: survey.city),
              AppInfoTile(title: 'Data de nascimento', value: survey.birthDate),
              AppInfoTile(title: 'Nota', value: survey.rate.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
