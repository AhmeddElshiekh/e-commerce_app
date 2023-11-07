
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/cart_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  getCart()async {
    emit(GetAllCartLoadingState());
    var result =await HomeRepo.fetchMyCart();
    result.fold((failure) {
      log('error when Get cart Home${failure.errMessage.toString()}');
      emit(GetAllCartErrorState(failure.errMessage,failure.errIcon));

    }, (cartItem) {
      emit(GetAllCartSuccessfulState(cartItem,HomeRepo.cart));
    });

  }


  // getCategoryProductId() async {
  //   emit(GetAllCartLoadingState());
  //   var result = await HomeRepo.fetchAllCarts();
  //   result.fold((failure) {
  //     log('error when Get All Cart ${failure.errMessage.toString()}');
  //     emit(GetAllCartErrorState(failure.errMessage, failure.errIcon));
  //   }, (cartModel) {
  //     emit(GetAllCartSuccessfulState(cartModel));
  //   });
  // }


}
