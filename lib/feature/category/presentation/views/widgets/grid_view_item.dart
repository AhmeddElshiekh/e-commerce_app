import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:smile_shop/feature/cart/presentation/manager/post_cart_cubit/post_cart_cubit.dart';
import 'package:smile_shop/feature/category/presentation/views/product_details_view.dart';
import 'package:smile_shop/feature/favorite/presentation/manager/get_favorite_cubit/get_favorite_cubit.dart';
import 'package:smile_shop/feature/favorite/presentation/manager/post_favorite_cubit/post_favorite_cubit.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.model});

  final DataProduct2 model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostFavoriteCubit, PostFavoriteState>(
      builder: (context, state) {
        var favoriteCubit = BlocProvider.of<PostFavoriteCubit>(context);
        return BlocBuilder<PostCartCubit, PostCartState>(
          builder: (context, state) {
            var postCubit = BlocProvider.of<PostCartCubit>(context);
            return BlocBuilder<GetFavoriteCubit, GetFavoriteState>(
              builder: (context, state) {
                if (state is GetAllFavoriteSuccessfulState) {
                  return BlocBuilder<GetCartCubit, GetCartState>(
                    builder: (context, state) {
                      if (state is GetAllCartSuccessfulState) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsView(model: model),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepPurple,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(
                                  16.0,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                        ),
                                        child:
                                            CachedImage(imageUrl: model.image!),
                                      ),
                                      if (model.discount != 0)
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.deepPurple,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(14.0),
                                            ),
                                          ),
                                          child: Text(
                                            ' DISCOUNT ${model.discount}%',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            model.name ?? '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            ' EGP ${model.price!.round()}',
                                            style: const TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight:
                                              FontWeight.w500,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18.0),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      favoriteCubit
                                                          .postFavorite(
                                                              productId: model
                                                                  .id!
                                                                  .toString());
                                                    },
                                                    icon: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(8),
                                                        ),
                                                        color: HomeRepo
                                                                .favoriteId
                                                                .contains(
                                                          model.id.toString(),
                                                        )
                                                            ? mainColor
                                                            : Colors.grey,
                                                      ),
                                                      child: const Icon(
                                                        color: Colors.white,
                                                        IconBroken.Heart,
                                                        size: 28,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  IconButton(
                                                    onPressed: () {
                                                      postCubit.postCart(
                                                        productId: model.id!
                                                            .toString(),
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
                                                                .contains(model
                                                                    .id
                                                                    .toString())
                                                            ? mainColor
                                                            : Colors.grey,
                                                      ),
                                                      child: const Icon(
                                                        color: Colors.white,
                                                        IconBroken.Plus,
                                                        size: 28,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          },
        );
      },
    );
  }
}
