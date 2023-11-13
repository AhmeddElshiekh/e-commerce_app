import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
import 'package:smile_shop/feature/authentication/data/models/auth_model.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  // var passwordController = TextEditingController();
  var emailController = TextEditingController();


  updateProfile() async {
    emit(UpdateProfileLoadingState());
    var result = await HomeRepo.updateProfile(
      email: emailController.text,
      name: nameController.text,
      phone: phoneController.text,
    );

    result.fold((failure) {
      log(failure.errMessage.toString());
      emit(UpdateProfileErrorState(failure.errMessage, failure.errIcon));
    }, (right) {
      emit(UpdateProfileSuccessfulState(HomeRepo.authModel));
    });
  }
}
