part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}


class PostFavoriteLoadingState extends FavoriteState {}
class PostFavoriteSuccessfulState extends FavoriteState {
  final FavoriteModel favoriteModel;

  PostFavoriteSuccessfulState(this.favoriteModel);
}
class PostFavoriteErrorState extends FavoriteState {
  final String errMassage;
  final IconData errIcon;

  PostFavoriteErrorState(this.errMassage, this.errIcon);
}


class GetAllFavoriteLoadingState extends FavoriteState {}
class GetAllFavoriteSuccessfulState extends FavoriteState {
  final List<DataFavorite2> dataFavorite2;

  GetAllFavoriteSuccessfulState(this.dataFavorite2);
}
class GetAllFavoriteErrorState extends FavoriteState {
  final String errMassage;
  final IconData errIcon;

  GetAllFavoriteErrorState(this.errMassage, this.errIcon);
}