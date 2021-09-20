import 'package:chatform/shared/data/models/survey_model.dart';
import 'package:chatform/shared/data/providers/survey_provider.dart';
import 'package:get/get.dart';

class SurveyRepository {
  final SurveyApiClient apiClient;

  SurveyRepository({required this.apiClient});

  Future<List<Survey>?> getAll() async {
    return await apiClient.fetchAll();
  }

  Future<Survey?> getId(String id) async {
    return await apiClient.fetchById(id);
  }

  Future<Survey?> delete(String id) async {
    return await apiClient.delete(id);
  }

  Future<Survey?> edit(Survey survey) async {
    return await apiClient.edit(survey);
  }

  Future<Survey?> add(Survey survey) async {
    return await apiClient.add(survey);
  }

  static SurveyRepository get to => Get.find<SurveyRepository>();
}
