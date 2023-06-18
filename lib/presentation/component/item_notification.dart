import 'package:flutter/material.dart';
import 'package:zahra/presentation/screens/notification_screen/notification_controller.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class ItemNotification extends StatelessWidget {

  NotificationController controller;
  int? index;
  ItemNotification( this.controller,int this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
     // padding: const EdgeInsets.only(bottom:  1),
      margin: const EdgeInsets.all(AppSize.s14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s20),
          color: ColorManager.darkPage),
      width: double.infinity,
      height: AppSize.s70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text.rich(
                 TextSpan(children: <TextSpan>[
                  TextSpan(text: controller.noteList[index!]),

                ]),
                textAlign: TextAlign.right,
                style: getNormalStyle(
                    color: ColorManager.darkSecondary,
                    fontSize: FontSize.s18)
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(AppSize.s12),
              child: Image.asset(controller.noteImages[index!]))
        ],
      ),
    );
  }
}
