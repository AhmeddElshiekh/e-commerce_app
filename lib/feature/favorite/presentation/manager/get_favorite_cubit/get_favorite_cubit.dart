
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/favorite_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';

part 'get_favorite_state.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  GetFavoriteCubit() : super(GetFavoriteInitial());
  getAllFavorite()async {
    emit(GetAllFavoriteLoadingState());
    var result =await HomeRepo.fetchAllFavorites();
    result.fold((failure) {
      log('error when Get all favorite ${failure.errMessage.toString()}');
      emit(GetAllFavoriteErrorState(failure.errMessage,failure.errIcon));

    }, (dataFavorite2) {

      emit(GetAllFavoriteSuccessfulState(dataFavorite2));
    });

  }
}
