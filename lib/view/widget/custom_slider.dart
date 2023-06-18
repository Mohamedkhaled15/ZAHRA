
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/on_boarding_controller.dart';
import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../data/data_sources/static_on_boarding/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val){
          controller.onPageChanged(val) ;
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(height: MediaQuery.of(context).size.height *.12),
              Image.asset(
                onBoardingList[i].image!,
                width: MediaQuery.of(context).size.width *.85,
                height: MediaQuery.of(context).size.height *.4,
                fit: BoxFit.fill,
              ),
               SizedBox(height: MediaQuery.of(context).size.height /36),
              Text(
                onBoardingList[i].body!,
                textAlign: TextAlign.center,
                style:   TextStyle(

                    color: ColorManager.secondary,
                    fontWeight: FontWeightManager.normal,
                    fontSize: FontSize.s24),
              ),
            ],
          ),
        ));
  }
}
