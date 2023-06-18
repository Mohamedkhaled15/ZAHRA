import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/on_boarding_controller.dart';
import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/strings_manger.dart';
import '../../core/constant/values_manger.dart';
import '../../core/constant/values_manger.dart';
import '../../core/constant/values_manger.dart';
import '../../core/constant/values_manger.dart';
import '../screens/on_boarding/on_boarding_start.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppMargin.m25,left: AppMargin.m25),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              Get.to(() => const OnBoardingStart(),
                  );
            },
            child: Text(
              AppStrings.onBoardingTextTwo,
              style: TextStyle(
                  color: ColorManager.secondary,
                  fontWeight: FontWeightManager.normal),
            ),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                controller.next();
              },
              child: Text(
                AppStrings.onBoardingTextOne,
                style: TextStyle(
                    color: ColorManager.secondary,
                    fontWeight: FontWeightManager.normal),
              )),
        ],
      ),
    );
  }
}
