import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_shop/core/errors/failure.dart';
import 'package:smile_shop/core/utils/api_service.dart';
import 'package:smile_shop/feature/authentication/data/models/auth_model.dart';

abstract class HomeRepo {
  static late AuthModel authModel;
  static Future<Either<Failure, void>> postRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      await ApiService.post(
        endPoints: 'register',
        data: {
          "email": email,
          "password": password,
          'name': name,
          'phone': phone,
        },
      ).then((value) {
         authModel = AuthModel.fromJson(value.data);
      });
      return right(null);
    }  catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage:e.toString()));
    }

  }

 static  Future<Either<Failure, void>> postLogin({
    required String email,
    required String password,
  }) async {
   try {
     await  ApiService.post(
       endPoints: 'login',
       data: {
         "email": email,
         "password": password,
       },
     ).then((value) {
       authModel = AuthModel.fromJson(value.data);

     });
     return right(null);
   }  catch (e) {
     if (e is DioException) {
       return left(ServerFailure.fromDioError(e));
     }
     return left(ServerFailure(errMessage:e.toString()));
   }

 }
}