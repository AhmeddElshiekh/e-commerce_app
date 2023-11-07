import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:smile_shop/feature/home/presentation/manager/get_all_products_cubit/get_products_cubit.dart';
import 'package:smile_shop/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/widgets/home_layout_bottom_nav_bar.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/widgets/home_layout_view_body.dart';
import 'package:smile_shop/feature/user/presentation/manager/user_cubit/user_cubit.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getCategoryHome(),
        ),
        BlocProvider(
          create: (context) => GetProductsCubit()..getAllProductHome(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit()..getAllFavorite(),
        ),
        BlocProvider(
          create: (context) => UserCubit()..getUserData(),
        )
      ],
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
