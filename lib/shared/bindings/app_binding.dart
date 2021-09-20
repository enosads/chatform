import 'package:chatform/shared/data/providers/survey_provider.dart';
import 'package:chatform/shared/data/repositories/survey_repository.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SurveyRepository(
        apiClient: SurveyApiClient(),
      ),
    );
  }
}
