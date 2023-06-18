import 'package:flutter/material.dart';


import '../../component/item_drawer.dart';
import '../../component/page_head.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      endDrawer: Drawer(
        backgroundColor: ColorManager.darkPage,
        child: const ItemDrawer(),
      ),
      body: SafeArea(
        child: Column(children: [
          Head(title: AppStrings.confirmRes),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(AppSize.s25),
              color: ColorManager.darkPage,

            ),
            margin:   const EdgeInsets.symmetric(
              horizontal: AppMargin.m14,),
            width: double.infinity,
            height: MediaQuery.of(context).size.height/3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(ImageAssets.done,scale: 2,),
                Text(AppStrings.done,style: getBoldStyle(color: ColorManager.darkSecondary,fontSize: FontSize.s32),)


              ],
            ),
          ),


        ]
        ),
      ),
    );
  }
}
