import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/category/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/loading_list_view_cart_and_favorite.dart';

class ListViewCart extends StatelessWidget {
  const ListViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetAllCartSuccessfulState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .76,
            child: AnimationLimiter(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    horizontalOffset: -300,
                    verticalOffset: -850,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(color: mainColor)),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: mainColor),
                              borderRadius: const BorderRadiusDirectional.all(
                                Radius.circular(18),
                              ),
                            ),
                            child:ClipRRect(
                              borderRadius:
                              const BorderRadiusDirectional.all(Radius.circular(20)),
                              child: CachedImage(imageUrl: state.model[index].product!.image!),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  state.model[index].product!.name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'EGP ${state.model[index].product!.discount == 0 ? state.model[index].product!.oldPrice!.round() : state.model[index].product!.price!.round()}',
                                        style: const TextStyle(
                                            color: mainColor, fontSize: 20),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          IconBroken.Delete,
                                          size: 30,
                                          color: mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: state.model.length,
              ),
            ),
          );
        } else if (state is GetAllCartErrorState) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              state.errMassage,
              style: const TextStyle(fontSize: 20),
            ),
          );
        } else {
          return LoadingListViewCartAndFavorite(
            height: MediaQuery.of(context).size.height * .76,
          );
        }
      },
    );
  }
}
