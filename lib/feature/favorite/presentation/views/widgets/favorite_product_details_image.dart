import 'package:flutter/material.dart';
import 'package:smile_shop/core/models/favorite_model.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FavoriteProductDetailsImages extends StatelessWidget {
  const FavoriteProductDetailsImages({super.key, required this.model});

  final Product model;

  @override
  Widget build(BuildContext context) {
    var smoothController = PageController();
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: Stack(
        alignment: const AlignmentDirectional(0, .8),
        children: [
          PageView.builder(
            controller: smoothController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Card(
              color: Colors.white,
              clipBehavior: Clip.hardEdge,
              child: CachedImage(imageUrl: model.image!),
            ),
            itemCount: 1,
          ),
          SmoothPageIndicator(
            controller: smoothController,
            count: 1,
            effect: const ExpandingDotsEffect(
                dotHeight: 12, activeDotColor: mainColor),
          ),
          if (model.discount != 0)
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14.0),
                    ),
                  ),
                  child: Text(
                    '  DISCOUNT ${model.discount}% ',
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
