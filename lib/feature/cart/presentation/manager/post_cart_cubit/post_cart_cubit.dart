import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/cart_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
part 'post_cart_state.dart';

class PostCartCubit extends Cubit<PostCartState> {
  PostCartCubit() : super(PostCartInitial());

  postCart({required String productId}) async {
    emit(PostCartLoadingState());
    var result = await HomeRepo.postCart(productId: productId);
    result.fold((failure) {
      log(failure.errMessage.toString());
      emit(PostCartErrorState(failure.errMessage, failure.errIcon));
    }, (right)async {
      if (HomeRepo.cartId.contains(productId) == true) {
        HomeRepo.cartId.remove(productId);
      } else {
        HomeRepo.cartId.add(productId);
      }
      await HomeRepo.fetchMyCart();
      emit(PostCartSuccessfulState(HomeRepo.cartModel));
    });
  }
}
