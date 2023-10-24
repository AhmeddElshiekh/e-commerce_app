part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class ShopRegisterLoadingState extends AuthState {}
class ShopRegisterSuccessfulState extends AuthState {
  final AuthModel authModel;

  ShopRegisterSuccessfulState(this.authModel);
}
class ShopRegisterErrorState extends AuthState {
  final String errMassage;
  final IconData errIcon;

  ShopRegisterErrorState(this.errMassage, this.errIcon);
}

class ShopLoginLoadingState extends AuthState {}
class ShopLoginSuccessfulState extends AuthState {
  final AuthModel authModel;

  ShopLoginSuccessfulState(this.authModel);

}
class ShopLoginErrorState extends AuthState {
  final String errMassage;
  final IconData errIcon;

  ShopLoginErrorState(this.errMassage, this.errIcon);
}



class AuthShowPasswordState extends AuthState{}