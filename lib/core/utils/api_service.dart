import 'package:dio/dio.dart';
import 'package:smile_shop/core/utils/constant.dart';

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

  static Future<Map<String, dynamic>> get({required String endPoints}) async {
    dio.options.headers = {
      'lang': 'en',
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    Response response = await dio.get('$baseUrl$endPoints');

    return response.data;
  }



  static Future<dynamic> post({
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

  static Future<Map<String, dynamic>> returnPost({
    required String endPoints,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    Response response = await dio.post('$baseUrl$endPoints',);

    return response.data;
  }

  static Future<dynamic> put({
    required String endPoints,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.put('$baseUrl$endPoints', data: data);
  }

}
