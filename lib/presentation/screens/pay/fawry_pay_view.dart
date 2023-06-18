import 'package:flutter/material.dart';


import '../../component/continue_button.dart';
import '../../component/item_drawer.dart';
import '../../component/page_head.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class PayFawry extends StatelessWidget {
  const PayFawry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      endDrawer: Drawer(
        backgroundColor: ColorManager.darkPage,
        child: const ItemDrawer(),
      ),
      body: SafeArea(
        child: ListView(
            physics: const PageScrollPhysics(),
            children: [
          Head(title: AppStrings.payWithFawry),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin:   EdgeInsets.symmetric(
              horizontal: AppMargin.m14,),
            width: double.infinity,
            height: 320,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),

                        color: ColorManager.darkSecondary
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.creditCardLabel,
                        style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s22),),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                      color: ColorManager.darkPage,

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(AppStrings.fawry1,style: getNormalStyle(color: ColorManager.gray,fontSize: FontSize.s18),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Image.asset(ImageAssets.fawry2,scale: 4,),
                          SizedBox(width: 10,),
                          Text(AppStrings.fawry2,style: getBoldStyle(color: ColorManager.darkSecondary),),
                        ],),
                        Text(AppStrings.fawry3,style: getNormalStyle(color: ColorManager.gray),),
                        Text(AppStrings.fawry4,style: getBoldStyle(color: ColorManager.darkSecondary),),
                        Text(AppStrings.fawry5,style: getNormalStyle(color: ColorManager.gray),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text(AppStrings.fawry61,style: getBoldStyle(color: ColorManager.darkSecondary,),),
                          Text(AppStrings.fawry62,style: getLightStyle(color: ColorManager.gray,fontSize: FontSize.s20),),
                          Text(AppStrings.fawry63,style: getBoldStyle(color: ColorManager.darkSecondary),),
                          Text(AppStrings.fawry64,style: getLightStyle(color: ColorManager.gray,fontSize: FontSize.s20),),
                        ],),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
             SizedBox(
                height: MediaQuery.of(context).size.height/4.5,
              ),
          ContinueButton(
            text: AppStrings.pay,
            routes: Routes.done,
          ),


        ]
        ),
      ),
    );
  }
}
