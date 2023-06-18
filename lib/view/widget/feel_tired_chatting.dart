import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/image_assets_manager.dart';
import '../../core/constant/strings_manger.dart';
import '../../core/constant/values_manger.dart';
import 'item_radio.dart';

class FeelTiredChatting extends StatefulWidget {
  const FeelTiredChatting({Key? key}) : super(key: key);

  @override
  State<FeelTiredChatting> createState() => _FeelTiredChattingState();
}

class _FeelTiredChattingState extends State<FeelTiredChatting> {
  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Image.asset(AppImageAsset.personChatting,height: MediaQuery.of(context).size.height/16,),
            ),
            Container(
              padding: const EdgeInsets.only(right: 8,top: 2),
              height: MediaQuery.of(context).size.height/24,
              width: MediaQuery.of(context).size.width/3.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorManager.white,
              ),child: Text("صح نومك",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18,
                fontWeight: FontWeightManager.bold),),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 63,),
          child: Container(
            padding: const EdgeInsets.only(right: 8,top: 2),
            height: MediaQuery.of(context).size.height/22,
            width: MediaQuery.of(context).size.width/2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: ColorManager.white,
            ),child: Text(
            AppStrings.anyTiredFelling,style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18,fontWeight: FontWeightManager.bold),
          ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 60,),
          child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.only(left: 30,),
              height: MediaQuery.of(context).size.height/5.5,
              width: MediaQuery.of(context).size.width/3.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorManager.white,
              ),
              child:Column(
                children: const [
                  ItemRadio(text1: "نعم",
                    text3: "ربما",
                    text2: "لا",),

                ],
              )),
        ),
      ],
    );
  }
}
