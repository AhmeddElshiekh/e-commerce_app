import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:smile_shop/feature/cart/presentation/manager/post_cart_cubit/post_cart_cubit.dart';
import 'package:smile_shop/feature/cart/presentation/views/cart_product_details_view.dart';
import 'package:smile_shop/feature/cart/presentation/views/widgets/loading_list_view_cart_and_favorite.dart';

class ListViewCart extends StatelessWidget {
  const ListViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCartCubit, PostCartState>(
      builder: (context, state) {
        var postCartCubit = BlocProvider.of<PostCartCubit>(context);
        return BlocBuilder<GetCartCubit, GetCartState>(
          builder: (context, state) {
            var getCartCubit = BlocProvider.of<GetCartCubit>(context);
            if (state is GetAllCartSuccessfulState) {
              if (state.model.isEmpty) {
                return const Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Text(
                      'There are no carts',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                );
              } else {
                return Expanded(
                  child: AnimationLimiter(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          delay: const Duration(milliseconds: 100),
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            horizontalOffset: -300,
                            verticalOffset: -850,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CartProductDetailsView(
                                            model: state.model[index].product!),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadiusDirectional.all(
                                      Radius.circular(20),
                                    ),
                                    border: Border.all(color: mainColor)),
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            border:
                                            Border.all(color: mainColor),
                                            borderRadius:
                                            const BorderRadiusDirectional
                                                .all(
                                              Radius.circular(18),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                            const BorderRadiusDirectional
                                                .all(Radius.circular(20)),
                                            child: CachedImage(
                                                imageUrl: state.model[index]
                                                    .product!.image!),
                                          ),
                                        ),
                                        if (state.model[index].product!
                                            .discount !=
                                            0)
                                          Align(
                                            alignment:
                                            AlignmentDirectional.topStart,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.deepPurple,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                  Radius.circular(14.0),
                                                ),
                                              ),
                                              child: Text(
                                                '  DISCOUNT ${state.model[index].product!.discount}% ',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            padding: const EdgeInsetsDirectional
                                                .symmetric(horizontal: 10),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    if (state
                                                        .model[index]
                                                        .product!
                                                        .discount !=
                                                        0)
                                                      Text(
                                                        ' EGP ${state.model[index].product!.price!.round()}',
                                                        style: const TextStyle(
                                                          color: mainColor,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontSize: size18,
                                                        ),
                                                      ),
                                                    if (state
                                                        .model[index]
                                                        .product!
                                                        .discount !=
                                                        0)
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                    if (state
                                                        .model[index]
                                                        .product!
                                                        .discount ==
                                                        0)
                                                      Text(
                                                        ' EGP ${state.model[index].product!.oldPrice!.round()}',
                                                        style: const TextStyle(
                                                          color: mainColor,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontSize: size18,
                                                        ),
                                                      ),
                                                    if (state
                                                        .model[index]
                                                        .product!
                                                        .discount !=
                                                        0)
                                                      Text(
                                                        ' ${state.model[index].product!.oldPrice!.round()} EGP',
                                                        style: const TextStyle(
                                                          fontSize: size18,
                                                          decoration:
                                                          TextDecoration
                                                              .lineThrough,
                                                          decorationColor:
                                                          mainColor,
                                                          decorationStyle:
                                                          TextDecorationStyle
                                                              .double,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                IconButton(
                                                  onPressed: () {
                                                    postCartCubit.postCart(
                                                        productId: state
                                                            .model[index]
                                                            .product!
                                                            .id
                                                            .toString());
                                                    Future.delayed(
                                                      const Duration(
                                                        milliseconds: 1000,
                                                      ),
                                                          () => getCartCubit
                                                          .getCart(),
                                                    );
                                                  },
                                                  icon: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      const BorderRadius
                                                          .all(
                                                        Radius.circular(8),
                                                      ),
                                                      color: HomeRepo.cartId
                                                          .contains(state
                                                          .model[index]
                                                          .product!
                                                          .id
                                                          .toString())
                                                          ? Colors.grey
                                                          : mainColor,
                                                    ),
                                                    child: const Icon(
                                                      color: Colors.white,
                                                      IconBroken.Delete,
                                                      size: 28,
                                                    ),
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
                        );
                      },
                      itemCount: state.model.length,
                    ),
                  ),
                );
              }
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
      },
    );
  }
}
