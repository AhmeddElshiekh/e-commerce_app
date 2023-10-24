import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smile_shop/feature/authentication/presentation/views/log_in_view.dart';
import 'package:smile_shop/generated/assets.dart';

class SplashBodyView extends StatefulWidget {
  const SplashBodyView({super.key});

  @override
  SplashBodyViewState createState() => SplashBodyViewState();
}

class SplashBodyViewState extends State<SplashBodyView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 2600), () {
      setState(() {
        _d = true;
      });
    });
    Timer(const Duration(milliseconds: 3800), () {
      setState(() {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LogInView() ,
            ));
      });
    });
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? h / 3
                      : 20,
              width: 20,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? h
                  : _c
                      ? 400
                      : 20,
              width: _d
                  ? w
                  : _c
                      ? 300
                      : 20,
              decoration: BoxDecoration(
                  color: _b ? Colors.black : Colors.transparent,
                  borderRadius: _d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: _e
                        ? Lottie.asset(Assets.imagesAnimation,)
                        : const SizedBox(),
                  ),
                  Center(
                    child: _e
                        ? AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Buy Any Thing...',
                                speed: const Duration(milliseconds: 50),
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                            isRepeatingAnimation: true,
                            repeatForever: true,
                            displayFullTextOnTap: true,
                            stopPauseOnTap: false,
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
