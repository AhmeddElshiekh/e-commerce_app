import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/cubit/check_internet/check_internet_cubit.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:smile_shop/feature/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      GetCartCubit()
        ..getCart(),
      child: BlocListener<CheckInternetCubit, CheckInternetState>(
        listener: (context, state) {
          if (state is ConnectedState) {
            BlocProvider.of<GetCartCubit>(context).getCart();
          }
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'My Carts',
                style: Styles.textStyle30,
              ),
            ),
            body: const CartViewBody()
        ),
      ),
    );
  }
}



