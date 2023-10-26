import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCategoryName extends StatelessWidget {
  const LoadingCategoryName({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          width: MediaQuery.of(context).size.width * .4,
          margin: const EdgeInsetsDirectional.only(
              top: 6.0, start: 6.0, bottom: 6.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                bottomStart: Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ListView.builder(
            itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey[500]!,
              highlightColor: Colors.grey[100]!,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 50),
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
