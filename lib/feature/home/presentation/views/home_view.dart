import 'package:flutter/material.dart';
import 'package:smile_shop/feature/home/presentation/views/widgets/list_view_category_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category',style: TextStyle(
              fontSize: 30,
            ),),
            ListViewCategoryHome()
          ],

        ),
      ),
    );
  }
}
