part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeGetCategoryHomeSuccessfulState extends HomeState {
 final List<Data2> model;

  HomeGetCategoryHomeSuccessfulState(this.model);

}
class HomeGetCategoryHomeErrorState extends HomeState {
  final String errMassage;
  final IconData errIcon;

  HomeGetCategoryHomeErrorState(this.errMassage, this.errIcon);
}
class HomeGetCategoryHomeLoadingState extends HomeState {}


