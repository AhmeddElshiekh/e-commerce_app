import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/feature/category/presentation/views/product_details_view.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.index, required this.model});

  final int index;
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
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
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        CachedImage(imageUrl: model.images![0]),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            IconBroken.Heart,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (model.priceAfterDiscount != null)
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                        ),
                      ),
                      child: const Text(
                        'OFFER',
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
                        model.title ?? '',
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
                          if (model.priceAfterDiscount != null)
                            Text(
                              ' EGP ${model.priceAfterDiscount}',
                              style: const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          if (model.priceAfterDiscount != null)
                            const SizedBox(
                              width: 5,
                            ),
                          if (model.priceAfterDiscount == null)
                            Text(
                              ' EGP ${model.price}',
                              style: const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w500,

                              ),
                            ),
                          if (model.priceAfterDiscount != null)
                            Text(
                              ' ${model.price} EGP',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.deepPurple,
                                  decorationStyle: TextDecorationStyle.double),
                            ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Review(${model.ratingsAverage})',
                              style: const TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(IconBroken.Plus),
                            ),
                          ],
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
  }
}
