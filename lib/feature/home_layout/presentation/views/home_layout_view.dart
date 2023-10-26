import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/home/presentation/manager/home_cubit.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/widgets/home_layout_bottom_nav_bar.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/widgets/home_layout_view_body.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCategoryHome(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Smile Shop',
            style: Styles.textStyle30,
          ),
        ),
        body: const HomeLayoutViewBody(),
        bottomNavigationBar: const HomeLayoutBottomNavBar(),
      ),
    );
  }
}
