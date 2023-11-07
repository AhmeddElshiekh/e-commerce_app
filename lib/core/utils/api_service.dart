import 'package:dio/dio.dart';

class ApiService {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static String routeBaseUrl = 'https://route-ecommerce.onrender.com/api/v1/';
  static String baseUrl = 'https://student.valuxapps.com/api/';
  static dynamic token;

  static Future<Map<String, dynamic>> get({required String endPoints}) async {
    dio.options.headers = {
      'lang': 'en',
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    Response response = await dio.get('$baseUrl$endPoints');

    return response.data;
  }

  static Future<Response> post({
    required String endPoints,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.post('$baseUrl$endPoints', data: data);
  }
}
