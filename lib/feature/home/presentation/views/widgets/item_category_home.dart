import 'package:flutter/material.dart';
import 'package:smile_shop/core/models/category_model.dart';

class ItemCategoryHome extends StatelessWidget {
  const ItemCategoryHome({super.key, required this.model});
final Data2 model;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(model.image ?? ''),
        ),
        const SizedBox(
          height: 10,
        ),
         Text(model.name  ?? '')
      ],
    );
  }
}
