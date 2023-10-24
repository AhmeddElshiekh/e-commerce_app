
import 'package:flutter/material.dart';
import 'package:smile_shop/feature/home/presentation/views/widgets/item_category_home.dart';

class ListViewCategoryHome extends StatelessWidget {
  const ListViewCategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ItemCategoryHome(),
        itemCount: 10, separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 5,
        );
      },
      ),
    );
  }
}
