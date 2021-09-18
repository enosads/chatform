import 'package:chatform/shared/data/providers/survey_provider.dart';
import 'package:chatform/shared/data/repositories/survey_repository.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        repository: SurveyRepository(
          apiClient: SurveyApiClient(),
        ),
      ),
    );
  }
}
