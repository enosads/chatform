import 'package:chatform/shared/data/models/survey_model.dart';
import 'package:chatform/shared/data/repositories/survey_repository.dart';
import 'package:chatform/shared/utils/app_toast.dart';
import 'package:chatform/shared/utils/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyController extends GetxController {
  final repository = SurveyRepository.to;
  final messageController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  var rate = 3.0;

  final _isMessageEmpty = true.obs;

  final listViewController = ScrollController();

  final messageFocusNode = FocusNode();

  bool get isMessageEmpty => _isMessageEmpty.value;

  set isMessageEmpty(val) => _isMessageEmpty.value = val;

  final _dateBirth = ''.obs;

  get dateBirth => _dateBirth.value;

  set dateBirth(val) => _dateBirth.value = val;

  final _city = ''.obs;

  get city => _city.value;

  set city(val) => _city.value = val;

  final _name = ''.obs;

  get name => _name.value;

  set name(val) => _name.value = val;

  final _step = 1.obs;

  get step => _step.value;

  set step(val) => _step.value = val;

  void onMessageChange(String value) {
    isMessageEmpty = value.isEmpty ? true : false;
  }

  String? dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    const pattern =
        r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?'
        r'[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3'
        r'(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|'
        r'[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?'
        r':0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';
    RegExp regex = RegExp(pattern);

    return !regex.hasMatch(value) || value.length != 10
        ? 'Data inválida'
        : null;
  }

  String? requiredFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
  }

  handleSendMessage() {
    if (formKey.currentState?.validate() ?? false) {
      switch (step) {
        case 1:
          name = messageController.text;
          break;
        case 2:
          city = messageController.text;
          break;
        case 3:
          dateBirth = messageController.text;
          break;
      }

      messageController.clear();
      isMessageEmpty = true;
      if (step < 4) {
        step += 1;
      }
      if (step == 3) {
        Get.focusScope?.unfocus();
      }

      Future.delayed(const Duration(milliseconds: 100)).then(
        (value) {
          if (step == 3) {
            Get.focusScope?.previousFocus();
          }
          return listViewController.animateTo(
            listViewController.position.maxScrollExtent,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 500),
          );
        },
      );
    }
  }

  void handleUpdateRate(double value) {
    rate = value;
  }

  void handleSendSurvey() async {
    final newSurvey = Survey(
      birthDate: DateUtil.toDateTime(dateBirth).toIso8601String(),
      city: city,
      rate: rate,
      createdAt: DateTime.now().toIso8601String(),
      name: name,
    );
    final response = await repository.apiClient.add(newSurvey);
    Get.back();
    if (response != null) {
      AppToast.toast(message: 'Pesquisa enviada com sucesso');
    } else {
      AppToast.toast(message: 'Ocorreu um erro ao enviar pesquisa');
    }
  }

  static SurveyController get to => Get.find();
}
