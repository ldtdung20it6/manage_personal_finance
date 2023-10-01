import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/dash_board/splash/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double opacity = 0.2;
  bool isFaded = false;
  @override
  void initState() {
    super.initState();
    _startAnimation();
  }
  void _startAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      opacity = 1.0;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      opacity = 0.2;
    });
    _startAnimation();
  }
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.put(SplashController());
    });
    return Scaffold(
        body: Center(
      child: TweenAnimationBuilder<double>(
        duration: const Duration(seconds: 2),
        tween: Tween<double>(begin: 0.2, end: opacity),
        builder: (BuildContext context, double value, Widget? child) {
          return Opacity(
            opacity: value,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFaded = !isFaded;
                });
              },
              child: Image.asset('assets/images/splash.jpg'),
            ),
          );
        },
      ),
    ));
  }
}
