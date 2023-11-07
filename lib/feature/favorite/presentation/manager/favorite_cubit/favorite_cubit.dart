import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/favorite_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  postFavorite({
    required num productId
}) async {
    emit(PostFavoriteLoadingState());
    var result = await HomeRepo.postFavorite(productId: productId);
    result.fold((failure) {
      log(failure.errMessage.toString());
      emit(PostFavoriteErrorState(failure.errMessage,failure.errIcon));

    }, (right) {
      emit(PostFavoriteSuccessfulState(HomeRepo.favoriteModel));
    });
  }


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
