import 'dart:async';

import 'package:flutter/material.dart';

import 'package:zahra/view/screens/splash_screen/splash_animation.dart';

import '../../../core/constant/image_assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), navigateToSplashAnimation);
  }

  void navigateToSplashAnimation() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctc) => const SplashAnimation()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(AppImageAsset.splashImage,scale: 2,),
      ),
    );
  }
}
