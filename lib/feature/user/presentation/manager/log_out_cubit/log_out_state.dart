part of 'log_out_cubit.dart';

@immutable
abstract class LogOutState {}

class LogOutInitial extends LogOutState {}
class ShopLogOutLoadingState extends LogOutState {}
class ShopLogOutSuccessfulState extends LogOutState {
  final AuthModel authModel;

  ShopLogOutSuccessfulState(this.authModel);
}
class ShopLogOutErrorState extends LogOutState {
  final String errMassage;
  final IconData errIcon;

  ShopLogOutErrorState(this.errMassage, this.errIcon);
}
