part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileLoadingState extends UpdateProfileState {}
class UpdateProfileSuccessfulState extends UpdateProfileState {
  final AuthModel authModel;

  UpdateProfileSuccessfulState(this.authModel);
}
class UpdateProfileErrorState extends UpdateProfileState {
  final String errMassage;
  final IconData errIcon;

  UpdateProfileErrorState(this.errMassage, this.errIcon);
}