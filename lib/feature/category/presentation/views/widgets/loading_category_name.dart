import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCategoryName extends StatelessWidget {
  const LoadingCategoryName({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        margin:
            const EdgeInsetsDirectional.only(top: 6.0, start: 6.0, end: 6.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(10.0), topEnd: Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey[500]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 15,
                    width: 180,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 25,
                    width: 120,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
