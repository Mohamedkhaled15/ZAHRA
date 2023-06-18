
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/on_boarding_controller.dart';
import '../../core/constant/colors_manager.dart';
import '../../data/data_sources/static_on_boarding/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                        (index) => AnimatedContainer(
                      margin: const EdgeInsets.only(right: 5),
                      duration: const Duration(milliseconds: 900),
                      width: controller.currentPage == index ? 20 : 5,
                      height: 6,
                      decoration: BoxDecoration(
                          color: ColorManager.secondary,
                          borderRadius: BorderRadius.circular(10)),
                    ))
              ],
            ),
          ),
        ));
  }
}
