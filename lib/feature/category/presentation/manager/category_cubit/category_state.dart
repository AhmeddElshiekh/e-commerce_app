part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategorySuccessfulState extends CategoryState {
  final List<DataProduct2> model;

  CategorySuccessfulState(this.model);

}
class CategoryErrorState extends CategoryState {
  final String errMassage;
  final IconData errIcon;

  CategoryErrorState(this.errMassage, this.errIcon);
}
class CategoryLoadingState extends CategoryState {}



