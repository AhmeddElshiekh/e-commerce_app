import 'package:flutter/material.dart';
import 'package:smile_shop/generated/assets.dart';

class ItemCategoryHome extends StatelessWidget {
  const ItemCategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage(Assets.imagesSmileShop),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Man Clothes')
      ],
    );
  }
}
