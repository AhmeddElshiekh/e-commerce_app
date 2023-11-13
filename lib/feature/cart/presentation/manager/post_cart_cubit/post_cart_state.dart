part of 'post_cart_cubit.dart';

@immutable
abstract class PostCartState {}

class PostCartInitial extends PostCartState {}
class PostCartLoadingState extends PostCartState {}
class PostCartSuccessfulState extends PostCartState {
  final CartModel cartModel;

  PostCartSuccessfulState(this.cartModel);
}
class PostCartErrorState extends PostCartState {
  final String errMassage;
  final IconData errIcon;

  PostCartErrorState(this.errMassage, this.errIcon);
}

