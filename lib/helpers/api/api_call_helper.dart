import 'package:dio/dio.dart';
import 'package:wtf_gym_assignment/helpers/api/api_logging_interceptor.dart';

class ApiCallHelper<T> {
  final Dio _dio;
  final String authToken;

  ApiCallHelper(
      {this.authToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI0cTYwTWs3R0poeXg5IiwibmFtZSI6Ik5hcmVzaCIsImlhdCI6"})
      : _dio = Dio() {
    _addInterceptors(_dio);
  }

  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await _dio.get(url,
          options: Options(headers: {
            'Authorization': 'Bearer $authToken',
          }));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to make GET request: ${response.statusCode}');
      }
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      throw Exception('Failed to make GET request: $e');
    }
  }

  void _addInterceptors(Dio dio) {
    dio.interceptors.add(APILoggingInterceptor());
  }
}
