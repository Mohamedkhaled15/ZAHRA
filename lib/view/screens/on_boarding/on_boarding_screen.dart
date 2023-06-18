import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zahra/core/constant/colors_manager.dart';

import '../../../controller/on_boarding_controller.dart';
import '../../widget/custom_row_onboarding.dart';
import '../../widget/custom_slider.dart';
import '../../widget/dot_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 6,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      CustomDotControllerOnBoarding(),
                      CustomButtonOnBoarding()
                    ],
                  ),
                ))
          ]),
        ));
  }
}
