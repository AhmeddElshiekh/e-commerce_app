import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_shop/core/errors/failure.dart';
import 'package:smile_shop/core/models/cart_model.dart';
import 'package:smile_shop/core/models/category_model.dart';
import 'package:smile_shop/core/models/favorite_model.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/utils/api_service.dart';
import 'package:smile_shop/feature/authentication/data/models/auth_model.dart';

abstract class HomeRepo {
  static late AuthModel authModel;
  static late FavoriteModel favoriteModel;
  static late DataCart cart;

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
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  static Future<Either<Failure, void>> postLogin({
    required String email,
    required String password,
  }) async {
    try {
      await ApiService.post(
        endPoints: 'login',
        data: {
          "email": email,
          "password": password,
        },
      ).then((value) {
        authModel = AuthModel.fromJson(value.data);
      });
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  static Future<Either<Failure, List<Data2>>> fetchCategory() async {
    try {
      var data = await ApiService.get(endPoints: 'categories');
      List<Data2> data2 = [];
      for (var item in data['data']['data']) {
        data2.add(Data2.fromJson(item));
      }
      return right(data2);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  static Future<Either<Failure, List<DataProduct2>>> fetchCategoryProductsId(
      {required num id}) async {
    try {
      var data = await ApiService.get(
        endPoints: 'products?category_id=$id',
      );
      List<DataProduct2> data2 = [];
      for (var item in data['data']['data']) {
        data2.add(DataProduct2.fromJson(item));
      }
      return right(data2);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  static Future<Either<Failure, List<DataProduct2>>> fetchAllProducts() async {
    try {
      var data = await ApiService.get(
        endPoints: 'products',
      );
      List<DataProduct2> data2 = [];
      for (var item in data['data']['data']) {
        data2.add(DataProduct2.fromJson(item));
      }
      return right(data2);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  static Future<Either<Failure, List<CartItems>>> fetchMyCart() async {
    try {
      var data = await ApiService.get(
        endPoints: 'carts',
      );
      List<CartItems> cartItem = [];
      for (var item in data['data']['cart_items']) {
        cartItem.add(CartItems.fromJson(item));
      }
      cart = DataCart.fromJson(data['data']);
      return right(cartItem);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  static Future<Either<Failure, void>> postFavorite({
    required num productId,
  }) async {
    try {
      await ApiService.post(
        endPoints: 'favorites',
        data: {
          'product_id': productId,
        },
      ).then((value) {
        favoriteModel = FavoriteModel.fromJson(value.data);
      });
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  static Future<Either<Failure, List<DataFavorite2>>>
      fetchAllFavorites() async {
    try {
      var data = await ApiService.get(
        endPoints: 'favorites',
      );
      List<DataFavorite2> dataFavorite2 = [];
      for (var item in data['data']['data']) {
        dataFavorite2.add(DataFavorite2.fromJson(item));
      }
      return right(dataFavorite2);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  static Future<Either<Failure, void>> getProfile() async {
    try {
      var data = await ApiService.get(
        endPoints: 'profile',
      );
      authModel = AuthModel.fromJson(data);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
