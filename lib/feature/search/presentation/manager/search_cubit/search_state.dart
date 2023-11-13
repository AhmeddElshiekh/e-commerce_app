part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccessfulState extends SearchState {
  final List<DataProduct2> model;

  SearchSuccessfulState(this.model);

}
class SearchErrorState extends SearchState {
  final String errMassage;
  final IconData errIcon;

  SearchErrorState(this.errMassage, this.errIcon);
}
class SearchLoadingState extends SearchState {}