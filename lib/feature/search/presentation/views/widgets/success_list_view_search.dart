import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/cart/presentation/manager/post_cart_cubit/post_cart_cubit.dart';
import 'package:smile_shop/feature/favorite/presentation/manager/get_favorite_cubit/get_favorite_cubit.dart';
import 'package:smile_shop/feature/favorite/presentation/manager/post_favorite_cubit/post_favorite_cubit.dart';
import 'package:smile_shop/feature/search/presentation/views/search_product_details_view.dart';

class SuccessListViewSearch extends StatelessWidget {
  const SuccessListViewSearch({super.key, required this.model});

  final DataProduct2 model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoriteCubit, GetFavoriteState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<GetFavoriteCubit>(context);
        return BlocBuilder<PostCartCubit, PostCartState>(
          builder: (context, state) {
            var postCubit = BlocProvider.of<PostCartCubit>(context);
            return BlocBuilder<PostFavoriteCubit, PostFavoriteState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchProductDetailsView(model: model),
                      ),
                    );
                  },
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
                          child: ClipRRect(
                            borderRadius: const BorderRadiusDirectional.all(
                                Radius.circular(20)),
                            child: CachedImage(imageUrl: model.image!),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .25,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.name ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                ' EGP ${model.price!.round()}',
                                style: const TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                top: 15,
                                end: 15,
                                bottom: 20,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  BlocProvider.of<PostFavoriteCubit>(context)
                                      .postFavorite(
                                          productId: model.id.toString());
                                  Future.delayed(
                                    const Duration(
                                      milliseconds: 1000,
                                    ),
                                    () => cubit.getAllFavorite(),
                                  );
                                },
                                icon: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: HomeRepo.favoriteId
                                            .contains(model.id.toString())
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
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                end: 15,
                                bottom: 15,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  postCubit.postCart(
                                    productId: model.id!.toString(),
                                  );
                                },
                                icon: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: HomeRepo.cartId
                                            .contains(model.id.toString())
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
