import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  getCategoryProductId({
    required num categoryId
}) async {
    emit(CategoryLoadingState());
    var result = await HomeRepo.fetchCategoryProductsId(id: categoryId);
    result.fold((failure) {
      log('error when Get Category Home${failure.errMessage.toString()}');
      emit(CategoryErrorState(failure.errMessage, failure.errIcon));
    }, (data2) {
      emit(CategorySuccessfulState(data2));
    });
  }


}
