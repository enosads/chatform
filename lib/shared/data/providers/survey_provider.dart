import 'package:chatform/shared/data/models/survey_model.dart';
import 'package:chatform/shared/utils/http_client.dart';

class SurveyApiClient {
  Future<List<Survey>?> fetchAll() async {
    try {
      final response = await HttpClient.get('surveys/');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((survey) => Survey.fromMap(survey))
            .toList();
      } else {
        print('Error -getAll');
        return null;
      }
    } catch (_) {
      print('Error -getAll');
      return null;
    }
  }

  Future<Survey?> fetchById(String id) async {
    try {
      final response = await HttpClient.get('surveys/$id/');
      if (response.statusCode == 200) {
        return Survey.fromMap(response.data);
      } else {
        print('Error -getId');
      }
    } catch (_) {}
    return null;
  }

  Future<Survey?> add(Survey survey) async {
    try {
      final response = await HttpClient.post('surveys/', body: survey.toMap());
      if (response.statusCode == 201) {
        return Survey.fromMap(response.data);
      } else {
        print('Error -getId');
      }
    } catch (_) {}
    return null;
  }

  Future<Survey?> edit(Survey survey) async {
    try {
      final response = await HttpClient.put(
        'surveys/${survey.id}/',
        body: survey.toMap(),
      );
      if (response.statusCode == 200) {
        return Survey.fromMap(response.data);
      } else {
        print('Error -edit');
      }
    } catch (_) {}
    return null;
  }

  Future<Survey?> delete(String id) async {
    try {
      final response = await HttpClient.delete(
        'surveys/$id/',
      );
      if (response.statusCode == 200) {
        return Survey.fromMap(response.data);
      } else {
        print('Error -delete');
      }
    } catch (_) {}
    return null;
  }
}
