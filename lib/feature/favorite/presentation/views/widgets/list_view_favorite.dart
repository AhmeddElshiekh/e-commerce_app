import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smile_shop/core/models/favorite_model.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/core/utils/constant.dart';

class ListViewFavorite extends StatelessWidget {
  const ListViewFavorite({super.key, required this.state});

  final List<DataFavorite2> state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
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
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadiusDirectional.all(Radius.circular(20)),
                        child: CachedImage(imageUrl: state[index].product!.image!),
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
                            state[index].product!.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (state[index].product!.discount != 0)
                            Text(
                              ' EGP ${state[index].product!.price!.round()}',
                              style: const TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.w500,
                                fontSize: size18,
                              ),
                            ),
                          if (state[index].product!.discount != 0)
                            const SizedBox(
                              width: 5,
                            ),
                          if (state[index].product!.discount == 0)
                            Text(
                              ' EGP ${state[index].product!.oldPrice!.round()}',
                              style: const TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.w500,
                                fontSize: size18,
                              ),
                            ),
                          if (state[index].product!.discount != 0)
                            Text(
                              ' ${state[index].product!.oldPrice!.round()} EGP',
                              style: const TextStyle(
                                fontSize: size18,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: mainColor,
                                decorationStyle: TextDecorationStyle.double,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .312,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 30,
                              bottom: 20,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                size: 30,
                                color: mainColor,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          itemCount: state.length,
        ),
      ),
    );
  }
}
