import 'package:flutter/material.dart';

import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/font_manager.dart';
import '../../../core/constant/image_assets_manager.dart';
import '../../../core/constant/strings_manger.dart';
import '../../../core/constant/styles_manger.dart';
import '../../../core/constant/values_manger.dart';
import '../../widget/custom_text_button.dart';

class OnBoardingStart extends StatelessWidget {
  const OnBoardingStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/17,),
              Image.asset(AppImageAsset.onBoardingImageFour,
                height: MediaQuery.of(context).size.height/2.2,
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                 Text(AppStrings.onBoardingStarting,style:
                TextStyle(
                   fontWeight: FontWeightManager.normal,
                  fontFamily: FontConstants.fontFamily2,
                  color: ColorManager.secondary,
                  fontSize: AppSize.s32,

                ),textAlign: TextAlign.center,),
              SizedBox(height: MediaQuery.of(context).size.height/24,),

              const CustomTextButton(),

            ],
          ),
        ),
      ),
    );
  }
}
