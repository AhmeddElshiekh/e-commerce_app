import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/category_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getCategoryHome()async {
    emit(HomeGetCategoryHomeLoadingState());
    var result =await HomeRepo.fetchCategory();
    result.fold((failure) {
      log('error when Get Category Home${failure.errMessage.toString()}');
      emit(HomeGetCategoryHomeErrorState(failure.errMessage,failure.errIcon));

    }, (category) {

      emit(HomeGetCategoryHomeSuccessfulState(category));
    });

  }


}
