part of 'post_favorite_cubit.dart';

@immutable
abstract class PostFavoriteState {}

class FavoriteInitial extends PostFavoriteState {}


class PostFavoriteLoadingState extends PostFavoriteState {}
class PostFavoriteSuccessfulState extends PostFavoriteState {
  final FavoriteModel favoriteModel;

  PostFavoriteSuccessfulState(this.favoriteModel);
}
class PostFavoriteErrorState extends PostFavoriteState {
  final String errMassage;
  final IconData errIcon;

  PostFavoriteErrorState(this.errMassage, this.errIcon);
}

