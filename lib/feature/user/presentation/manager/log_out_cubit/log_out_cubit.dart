import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
import 'package:smile_shop/feature/authentication/data/models/auth_model.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(LogOutInitial());

  logOut() async {
    emit(ShopLogOutLoadingState());
    var result = await HomeRepo.postLogOut();

    result.fold((failure) {
      log(failure.errMessage.toString());
      emit(ShopLogOutErrorState(failure.errMessage, failure.errIcon));
    }, (right) {
      emit(ShopLogOutSuccessfulState(HomeRepo.authModel));
    });
  }

}
