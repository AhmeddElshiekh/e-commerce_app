part of 'get_products_cubit.dart';

abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class GetAllProductsSuccessfulState extends GetProductsState {
  final List<DataProduct2> model;

  GetAllProductsSuccessfulState(this.model);

}
class GetAllProductsErrorState extends GetProductsState {
  final String errMassage;
  final IconData errIcon;

  GetAllProductsErrorState(this.errMassage, this.errIcon);
}
class GetAllProductsLoadingState extends GetProductsState {}