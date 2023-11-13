part of 'user_cubit.dart';

abstract class UserState {}

class UserInitial extends UserState {}
class GetUserLoadingState extends UserState {}
class GetUserSuccessfulState extends UserState {
  final AuthModel authModel;

  GetUserSuccessfulState(this.authModel);
}
class GetUserErrorState extends UserState {
  final String errMassage;
  final IconData errIcon;

  GetUserErrorState(this.errMassage, this.errIcon);
}

// class ShopLogOutLoadingState extends UserState {}
// class ShopLogOutSuccessfulState extends UserState {
//   final AuthModel authModel;
//
//   ShopLogOutSuccessfulState(this.authModel);
// }
// class ShopLogOutErrorState extends UserState {
//   final String errMassage;
//   final IconData errIcon;
//
//   ShopLogOutErrorState(this.errMassage, this.errIcon);
// }
