import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';

class TotalPriceCard extends StatelessWidget {
  const TotalPriceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        if (state is GetAllCartSuccessfulState) {
          return Text(
            'EGP ${state.cartModel.total!.round()}',
            style: const TextStyle(
              fontSize: 24,
              color: mainColor,
            ),
          );
        } else if (state is GetAllCartLoadingState) {
          return Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              width: 100,
              height: 20,
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.all(Radius.circular(12)),
                color: Colors.white,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
