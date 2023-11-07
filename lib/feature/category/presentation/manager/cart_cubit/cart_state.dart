part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}



class GetAllCartSuccessfulState extends CartState {
  final List<CartItems> model;
  final DataCart cartModel;
  GetAllCartSuccessfulState(this.model, this.cartModel);

}

class GetAllCartErrorState extends CartState {
  final String errMassage;
  final IconData errIcon;

  GetAllCartErrorState(this.errMassage, this.errIcon);
}
class GetAllCartLoadingState extends CartState {}