import 'package:dio/dio.dart';

class HttpClient {
  static Future<Response> get(String route, {headers}) async {
    final h = headers ?? await _headersDefault();
    print('GET ${_getUrl(route)}');
    var response = await Dio().get(
      _getUrl(route),
      options: Options(
        headers: h,
        validateStatus: (status) {
          return status != null ? status < 500 : false;
        },
      ),
    );
    print('STAUS CODE: ${response.statusCode}');
    return response;
  }

  static Future<Response> post(String route, {body, headers}) async {
    final h = headers ?? await _headersDefault();
    print('POST ${_getUrl(route)}');
    var response = await Dio().post(
      _getUrl(route),
      data: body,
      options: Options(
        headers: h,
        validateStatus: (status) {
          return status != null ? status < 500 : false;
        },
      ),
    );
    print('STAUS CODE: ${response.statusCode}');
    return response;
  }

  static Future<Response> put(String route, {body}) async {
    final headers = await _headersDefault();
    print('PUT ${_getUrl(route)}');
    var response = await Dio().put(_getUrl(route),
        options: Options(
          headers: headers,
        ),
        data: body);
    print('STAUS CODE: ${response.statusCode}');
    return response;
  }

  static Future<Response> patch(String route, {body}) async {
    final headers = await _headersDefault();
    var response = await Dio().patch(_getUrl(route),
        options: Options(
          headers: headers,
          validateStatus: (status) {
            return status != null ? status < 500 : false;
          },
        ),
        data: body);
    print('STAUS CODE: ${response.statusCode}');
    return response;
  }

  static Future<Response> delete(String route) async {
    final headers = await _headersDefault();
    print('DELETE ${_getUrl(route)}');
    var response = await Dio().delete(
      _getUrl(route),
      options: Options(
        headers: headers,
      ),
    );
    print('STAUS CODE: ${response.statusCode}');
    return response;
  }

  static Future<Map<String, String>> _headersDefault() async {
    Map<String, String> headers = {
      "accept": "application/json",
    };
    return headers;
  }

  static const String BASE_URL =
      'https://6146162938339400175fc7f5.mockapi.io/api';

  static String _getUrl(String path) => '$BASE_URL/$path';
}
