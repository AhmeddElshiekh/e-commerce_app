import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListViewCategoryHome extends StatelessWidget {
  const LoadingListViewCategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: 200,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              const CircleAvatar(
                radius: 70,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                width: 100,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(20)),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          itemCount: 6,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 15,
            );
          },
        ),
      ),
    );
  }
}
