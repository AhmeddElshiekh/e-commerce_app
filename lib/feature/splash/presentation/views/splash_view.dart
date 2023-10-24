import 'package:flutter/material.dart';
import 'package:smile_shop/feature/splash/presentation/views/widgets/splash_body_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBodyView(),
    );
  }
}
