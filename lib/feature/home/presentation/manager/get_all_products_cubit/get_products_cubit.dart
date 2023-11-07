

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  getAllProductHome() async {
    emit(GetAllProductsLoadingState());
    var result = await HomeRepo.fetchAllProducts();
    result.fold((failure) {
      log('error when Get Category Home${failure.errMessage.toString()}');
      emit(GetAllProductsErrorState(failure.errMessage, failure.errIcon));
    }, (data2) {
      emit(GetAllProductsSuccessfulState(data2));
    });
  }
}
