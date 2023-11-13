part of 'get_favorite_cubit.dart';

abstract class GetFavoriteState {}

class GetFavoriteInitial extends GetFavoriteState {}

class GetAllFavoriteLoadingState extends GetFavoriteState {}
class GetAllFavoriteSuccessfulState extends GetFavoriteState {
  final List<DataFavorite2> dataFavorite2;

  GetAllFavoriteSuccessfulState(this.dataFavorite2);
}
class GetAllFavoriteErrorState extends GetFavoriteState {
  final String errMassage;
  final IconData errIcon;

  GetAllFavoriteErrorState(this.errMassage, this.errIcon);
}