import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smile_shop/core/utils/constant.dart';

class LoadingListViewCartAndFavorite extends StatelessWidget {
  const LoadingListViewCartAndFavorite({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
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
                    Shimmer.fromColors(
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor),
                          color: Colors.white,
                          borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(18),
                          ),
                        ),

                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(

                            baseColor: baseColor,
                            highlightColor: highlightColor,
                            child: Container(
                              height: 20,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadiusDirectional.all(Radius.circular(12)),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Shimmer.fromColors(
                            baseColor: baseColor,
                            highlightColor: highlightColor,
                            child: Container(
                              height: 20,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadiusDirectional.all(Radius.circular(12)),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Shimmer.fromColors(
                            baseColor: baseColor,
                            highlightColor: highlightColor,
                            child: Container(
                              height: 20,
                              width: 100,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadiusDirectional.all(Radius.circular(12)),
                                color: Colors.white,
                              ),
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
          itemCount: 4,
        ),
      ),
    );
  }
}
