import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/image_assets_manager.dart';
import '../on_boarding/on_boarding_screen.dart';

class SplashAnimation extends StatelessWidget {
  const SplashAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AnimatedSplashScreen(

        splash: AppImageAsset.logo,
        nextScreen: const OnBoardingScreen(),
        splashTransition: SplashTransition.rotationTransition,

      ),
    );
  }
}
