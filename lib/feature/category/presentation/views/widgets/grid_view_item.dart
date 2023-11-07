import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/category/presentation/views/product_details_view.dart';
import 'package:smile_shop/feature/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.index, required this.model});

  final int index;
  final DataProduct2 model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsView(model: model),
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
                        child: CachedImage(imageUrl: model.image!),
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
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Row(
                            children: [
                              if (model.discount != 0)
                                Expanded(
                                  child: Text(
                                    ' EGP ${model.price!.round()}',
                                    style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              if (model.discount != 0)
                                const SizedBox(
                                  width: 5,
                                ),
                              if (model.discount == 0)
                                Expanded(
                                  flex: 0,
                                  child: Text(
                                    ' EGP ${model.oldPrice!.round()}',
                                    style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              if (model.discount != 0)
                                Expanded(
                                  child: Text(
                                    ' ${model.oldPrice!.round()} EGP',
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.deepPurple,
                                      decorationStyle:
                                          TextDecorationStyle.double,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<FavoriteCubit>(context).postFavorite(productId: model.id!);
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      size: 28,
                                      color: model.inFavorites == true
                                          ? mainColor
                                          : Colors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(IconBroken.Plus),
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
      },
    );
  }
}
