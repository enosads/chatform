import 'package:chatform/modules/survay_form/widgets/bubble_chat.dart';
import 'package:chatform/shared/theme/app_colors.dart';
import 'package:chatform/shared/widgets/app_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'survey_controller.dart';
import 'widgets/app_form_input.dart';

class SurveyPage extends GetView<SurveyController> {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chatnilson',
          style: GoogleFonts.inter(),
        ),
        flexibleSpace: const AppGradientContainer(),
      ),
      body: Stack(
        children: [
          ListView(
            controller: controller.listViewController,
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 80, top: 16),
            children: [
              BubbleChat(
                step: 1,
                message: () =>
                    'Olá, eu sou Chatnilson, tudo bem? Para comerçarmos '
                    'preciso saber seu nome.',
                direction: ChatDirection.receiving,
              ),
              BubbleChat(
                step: 2,
                message: () => controller.name,
                direction: ChatDirection.sending,
              ),
              BubbleChat(
                step: 2,
                message: () =>
                    'Que satisfação, ${controller.name}. Agora que sei seu nome, '
                    'qual a cidade e estado que você mora?',
                direction: ChatDirection.receiving,
              ),
              BubbleChat(
                step: 3,
                message: () => controller.city,
                direction: ChatDirection.sending,
              ),
              BubbleChat(
                step: 3,
                message: () =>
                    'Legal! Agora que sabemos sua cidade e estado, quando'
                    ' foi que você nasceu?',
                direction: ChatDirection.receiving,
              ),
              BubbleChat(
                step: 4,
                message: () => controller.dateBirth,
                direction: ChatDirection.sending,
              ),
              BubbleChat(
                step: 4,
                message: () =>
                    'Você finalizou o teste. Faça uma avaliação sobre o '
                    'processo que realizou até chegar aqui. '
                    'Nós agradecemos!',
                direction: ChatDirection.receiving,
              ),
            ],
          ),
          Obx(
            () => controller.step >= 4
                ? Positioned(
                    bottom: 0,
                    child: Material(
                      elevation: 16,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        height: 80,
                        width: Get.width,
                        color: AppColors.primaryPalette.shade50.withAlpha(500),
                        child: ElevatedButton(
                          onPressed: controller.handleSendSurvey,
                          child: Text(
                            'ENVIAR RESPOSTAS',
                            style: GoogleFonts.inter(
                                color: AppColors.primaryPalette.shade50),
                          ),
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    bottom: 0,
                    child: Material(
                      elevation: 16,
                      child: Container(
                        height: 80,
                        width: Get.width,
                        color: AppColors.primaryPalette.shade50.withAlpha(500),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  right: 16,
                                  left: 16,
                                ),
                                child: AppFormInput(
                                  key: key,
                                ),
                              ),
                            ),
                            Obx(
                              () => !controller.isMessageEmpty
                                  ? GestureDetector(
                                      onTap: controller.handleSendMessage,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        child: const AppGradientContainer(
                                          child: Icon(
                                            Icons.send_outlined,
                                            color: Colors.white,
                                          ),
                                          width: 48,
                                          height: 48,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
