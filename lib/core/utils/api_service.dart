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

  static String baseUrl = 'https://student.valuxapps.com/api/';

  Future<Map<String, dynamic>> get({required String endPoints}) async {
    Response response = await dio.get('$baseUrl$endPoints');

    return response.data;
  }


  static Future<Response> post({
    required String endPoints,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers={
      'lang':'eg',
      // 'Authorization':token??'',
      'Content-Type':'application/json',
    };
      var response = await dio.post('$baseUrl$endPoints', data: data);
      print(response.data);
      return response;

  }
}
