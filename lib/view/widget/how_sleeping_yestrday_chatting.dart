import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/image_assets_manager.dart';
import '../../core/constant/strings_manger.dart';
import '../../core/constant/values_manger.dart';
import 'item_radio.dart';

class HowSleepingYestItem extends StatefulWidget {
  const HowSleepingYestItem({Key? key}) : super(key: key);

  @override
  State<HowSleepingYestItem> createState() => _HowSleepingYestItemState();
}

class _HowSleepingYestItemState extends State<HowSleepingYestItem> {
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
              width: MediaQuery.of(context).size.width/2.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorManager.white,
              ),child: Text(AppStrings.sleeping,style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18,
                fontWeight: FontWeightManager.bold),),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 60,),
          child: Container(
              height: MediaQuery.of(context).size.height/5.5,
              width: MediaQuery.of(context).size.width/2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorManager.white,
              ),
              child:Column(
                children: const [
                  ItemRadio(
                    text1: "نمت جيدا",
                    text2: "نوم متقطع",
                    text3: "لم استطع النوم",
                  ),

                ],
              )),
        ),
      ],
    );
  }
}
