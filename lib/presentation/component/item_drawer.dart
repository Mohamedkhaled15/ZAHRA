import 'package:flutter/material.dart';
import 'package:zahra/presentation/resources/assets_manager.dart';
import 'package:zahra/presentation/resources/color_manager.dart';
import 'package:zahra/presentation/resources/strings_manager.dart';
import 'package:zahra/presentation/resources/styles_manager.dart';


import '../../view/widget/button_logout.dart';
import 'drawer_line.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,left: 20),
      child: Column(
        children: [
          Expanded(
              child: Column(

                children: [
                  const SizedBox(
                    height: 70,
                  ),
                      DrawerLine(title: AppStrings.error, image: ImageAssets.error),
                  const SizedBox(
                    height: 50,
                  ),
                      DrawerLine(title:AppStrings.privacy, image:ImageAssets.user),
                  const SizedBox(
                    height: 50,
                  ),
                      InkWell(
                        onTap: (){
                          const ButtonLogoutItem();
                        },
                          child: DrawerLine(title:AppStrings.logout,image: ImageAssets.logout)),
            ],
          )),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ImageAssets.share,
                    color: ColorManager.darkSecondary,scale: 15, ),
                  SizedBox(height: 10,),
                  Text(AppStrings.share,style: getLightStyle(color: ColorManager.darkSecondary),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Image.asset(ImageAssets.star1,
                    scale: 4, ),
                  const SizedBox(height: 10,),
                  Text(AppStrings.rate,style: getLightStyle(color: ColorManager.darkSecondary),),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
