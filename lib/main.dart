import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/bloc_observer/bloc_observer.dart';
import 'package:smile_shop/core/repos/home_repo_implementation.dart';
import 'package:smile_shop/core/utils/api_service.dart';
import 'package:smile_shop/core/utils/cache_helper.dart';
import 'package:smile_shop/feature/authentication/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:smile_shop/feature/authentication/presentation/views/log_in_view.dart';
import 'package:smile_shop/feature/home_layout/presentation/manager/home_cubit/home_layout_cubit.dart';
import 'package:smile_shop/feature/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // fontFamily: 'DancingScript-VariableFont_wght',
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light,
        home: const LogInView(),
      ),
    );
  }
}
