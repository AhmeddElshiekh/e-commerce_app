import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/favorite_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';

part 'post_favorite_state.dart';

class PostFavoriteCubit extends Cubit<PostFavoriteState> {
  PostFavoriteCubit() : super(FavoriteInitial());

  postFavorite({required String productId}) async {
    emit(PostFavoriteLoadingState());
    var result = await HomeRepo.postFavorite(productId: productId);
    result.fold((failure) {
      log(failure.errMessage.toString());
      emit(PostFavoriteErrorState(failure.errMessage, failure.errIcon));
    }, (right)async {
      if (HomeRepo.favoriteId.contains(productId) == true) {
        HomeRepo.favoriteId.remove(productId);
      } else {
        HomeRepo.favoriteId.add(productId);
      }
      await HomeRepo.fetchAllFavorites();
      emit(PostFavoriteSuccessfulState(HomeRepo.favoriteModel));
    });
  }
}
