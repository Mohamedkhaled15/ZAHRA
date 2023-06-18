import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/values_manger.dart';

class ItemBackNavigate extends StatelessWidget {
   ItemBackNavigate({Key? key , this.onPressed}) : super(key: key);
  Function()?onPressed;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 5.6),
        width: MediaQuery.of(context).size.width/8,
        height: MediaQuery.of(context).size.height/22,
        decoration: BoxDecoration(
          color: ColorManager.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextButton(onPressed: onPressed, child: Text("عودة",
          style: TextStyle(
              color: ColorManager.white,
              height: 0.2,
              fontSize: AppSize.s16,
              fontWeight: FontWeightManager.bold
          ),)),
      ),
    );
  }
}
