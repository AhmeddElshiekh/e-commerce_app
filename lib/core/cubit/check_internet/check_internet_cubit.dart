import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'check_internet_state.dart';

class CheckInternetCubit extends Cubit<CheckInternetState> {
  StreamSubscription? _subscription;

  CheckInternetCubit() : super(CheckInternetInitial());

  static CheckInternetCubit get(context) => BlocProvider.of(context);

  void connected() {
    emit(ConnectedState(message: "Connected"));
  }

  void notConnected() {
    emit(NotConnectedState(message: "Not Connected"));
  }

  void checkConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        connected();
      } else {
        notConnected();
      }
    });
  }


  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
