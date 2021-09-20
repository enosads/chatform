import 'package:chatform/shared/data/models/survey_model.dart';
import 'package:chatform/shared/data/repositories/survey_repository.dart';
import 'package:chatform/shared/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final repository = SurveyRepository.to;

  final _loading = true.obs;

  get loading => _loading.value;

  set loading(val) => _loading.value = val;

  final _surveys = <Survey>[].obs;

  set surveys(value) => _surveys.value = value;

  List<Survey> get surveys => _surveys;

  @override
  void onInit() {
    super.onInit();
    fetchAllSurveys();
  }

  Future fetchAllSurveys() async {
    loading = true;
    surveys = await repository.getAll();
    loading = false;
    return;
  }

  static get to => Get.find<HomeController>();

  handleOpenSurveyForm() {
    Get.toNamed(AppRoutes.survey);
  }
}
