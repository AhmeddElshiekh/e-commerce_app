import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  late String val;

  getSearch({required String textSearch}) async {
    emit(SearchLoadingState());
    var result = await HomeRepo.search(textSearch: textSearch);
    result.fold((failure) {
      log('error when search Home${failure.errMessage.toString()}');
      emit(SearchErrorState(failure.errMessage, failure.errIcon));
    }, (data2) {
      emit(SearchSuccessfulState(data2));
    });
  }
}
