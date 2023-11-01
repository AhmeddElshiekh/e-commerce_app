import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingGridViewCategoryComponents extends StatelessWidget {
  const LoadingGridViewCategoryComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(top: 20, bottom: 500),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1/2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.all(Radius.circular(12)),
                color: Colors.white,
              ),
            ),
          );
        });
  }
}
