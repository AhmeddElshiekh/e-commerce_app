import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
import 'package:smile_shop/feature/authentication/data/models/auth_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var regPasswordController = TextEditingController();
  var regEmailController = TextEditingController();
  var logPasswordController = TextEditingController();
  var logEmailController = TextEditingController();


   register() async {
    emit(ShopRegisterLoadingState());
    var result = await HomeRepo.postRegister(email: regEmailController.text, password: regPasswordController.text, name: nameController.text, phone: phoneController.text);

    result.fold((failure) {
      log(failure.errMessage.toString());
      emit(ShopRegisterErrorState(failure.errMessage,failure.errIcon));

    }, (right) {

      emit(ShopRegisterSuccessfulState(HomeRepo.authModel));
    });
  }

  void login() async {
    emit(ShopLoginLoadingState());

    var result = await HomeRepo.postLogin(email: logEmailController.text, password: logPasswordController.text,);
    result.fold((failure) {
      log(failure.errMessage.toString());
      emit(ShopLoginErrorState(failure.errMessage,failure.errIcon));

    }, (right) {

      emit(ShopLoginSuccessfulState(HomeRepo.authModel));
    });

  }

  bool isHide = true;
  IconData suffix = Icons.visibility;

  void showPassword() {
    isHide = !isHide;
    suffix = isHide ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AuthShowPasswordState());
  }
}
