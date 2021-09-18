import 'package:chatform/shared/data/models/survey_model.dart';
import 'package:chatform/shared/data/repositories/survey_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final SurveyRepository repository;

  HomeController({required this.repository});

  final _surveys = <Survey>[].obs;

  set surveys(value) => _surveys.value = value;

  List<Survey> get surveys => _surveys;

  @override
  void onInit() {
    super.onInit();
    fetchAllSurveys();
  }

  fetchAllSurveys() async {
    surveys = await repository.getAll();
  }

  static get to => Get.find<HomeController>();

  void handleOpenSurveyForm() {
  }
}
