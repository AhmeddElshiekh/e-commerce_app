import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/bloc_observer/bloc_observer.dart';
import 'package:smile_shop/core/utils/api_service.dart';
import 'package:smile_shop/core/utils/cache_helper.dart';
import 'package:smile_shop/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:smile_shop/feature/authentication/presentation/views/log_in_view.dart';
import 'package:smile_shop/feature/category/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:smile_shop/feature/home_layout/presentation/manager/home_cubit/home_layout_cubit.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/home_layout_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  ApiService.token = CacheHelper.getSaveData(key: 'token');
  print('${ApiService.token}');
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
          create: (context) => CartCubit()..getCart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // fontFamily: 'DancingScript-VariableFont_wght',
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light,
        home: ApiService.token == null ? const LogInView()  :const HomeLayoutView(),
      ),
    );
  }
}
