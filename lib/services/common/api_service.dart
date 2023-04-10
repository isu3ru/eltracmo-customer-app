import 'package:dio/dio.dart';
import 'package:eltracmo_customers/services/common/routes.dart';

class ApiService {
  static final Dio dio = Dio();

  static Future<Map<String, dynamic>?> getRequest(String route,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      String url = baseUrl + route;
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<Map<String, dynamic>?> postRequest(String route,
      Map<String, dynamic>? data, Map<String, dynamic>? headers) async {
    try {
      String url = baseUrl + route;
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: headers,
        ),
      );

      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<Map<String, dynamic>?> putRequest(String route,
      Map<String, dynamic>? data, Map<String, dynamic>? headers) async {
    try {
      String url = baseUrl + route;
      final response = await dio.put(
        url,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<Map<String, dynamic>?> deleteRequest(
      String route, Map<String, dynamic>? headers) async {
    try {
      String url = baseUrl + route;

      final response = await dio.delete(
        url,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<Map<String, dynamic>?> uploadFile(
      String route, FormData formData, Map<String, dynamic>? headers) async {
    // upload form data with file
    try {
      String url = baseUrl + route;
      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
