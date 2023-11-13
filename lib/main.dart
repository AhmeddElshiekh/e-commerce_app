import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/cubit/bloc_observer/bloc_observer.dart';
import 'package:smile_shop/core/cubit/check_internet/check_internet_cubit.dart';
import 'package:smile_shop/core/utils/api_service.dart';
import 'package:smile_shop/core/utils/cache_helper.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:smile_shop/feature/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:smile_shop/feature/cart/presentation/manager/post_cart_cubit/post_cart_cubit.dart';
import 'package:smile_shop/feature/favorite/presentation/manager/get_favorite_cubit/get_favorite_cubit.dart';
import 'package:smile_shop/feature/favorite/presentation/manager/post_favorite_cubit/post_favorite_cubit.dart';
import 'package:smile_shop/feature/home/presentation/manager/get_all_products_cubit/get_products_cubit.dart';
import 'package:smile_shop/feature/home_layout/presentation/manager/home_cubit/home_layout_cubit.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/home_layout_view.dart';
import 'package:smile_shop/feature/splash/presentation/views/splash_view.dart';
import 'package:smile_shop/feature/user/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:smile_shop/feature/user/presentation/manager/user_cubit/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  token = CacheHelper.getSaveData(key: 'token') ?? '';
  log(token);
  ApiService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => HomeLayoutCubit(),
        ),
        BlocProvider(
          create: (context) => GetCartCubit()..getCart(),
        ),
        BlocProvider(
          create: (context) => GetFavoriteCubit()..getAllFavorite(),
        ),
        BlocProvider(
          create: (context) => PostCartCubit(),
        ),
        BlocProvider(
          create: (context) => PostFavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit()..getUserData(),
        ),
        BlocProvider(
          create: (context) => GetProductsCubit()..getAllProductHome(),
        ),
        BlocProvider(
          create: (context) => UpdateProfileCubit(),
        ),
        BlocProvider(
          create: (context) => CheckInternetCubit()..checkConnection(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light,
        home: token == '' ? const SplashView() : const HomeLayoutView(),
      ),
    );
  }
}
