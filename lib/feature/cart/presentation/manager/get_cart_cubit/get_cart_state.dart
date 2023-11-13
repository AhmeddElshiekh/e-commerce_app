part of 'get_cart_cubit.dart';

@immutable
abstract class GetCartState {}

class CartInitial extends GetCartState {}



class GetAllCartSuccessfulState extends GetCartState {
  final List<CartItems> model;
  final DataCart cartModel;
  GetAllCartSuccessfulState(this.model, this.cartModel);

}

class GetAllCartErrorState extends GetCartState {
  final String errMassage;
  final IconData errIcon;

  GetAllCartErrorState(this.errMassage, this.errIcon);
}
class GetAllCartLoadingState extends GetCartState {}