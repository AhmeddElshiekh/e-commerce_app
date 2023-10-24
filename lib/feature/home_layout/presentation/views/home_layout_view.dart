import 'package:flutter/material.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/widgets/home_layout_bottom_nav_bar.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/widgets/home_layout_view_body.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Smile Shop',
            style: TextStyle(fontSize: 28),
          ),
        ),
        body: const HomeLayoutViewBody(),
        bottomNavigationBar: const HomeLayoutBottomNavBar(),
    );
  }
}
