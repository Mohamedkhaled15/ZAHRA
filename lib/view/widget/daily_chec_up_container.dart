import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/values_manger.dart';

class CustomCheckUpContainer extends StatelessWidget {


  final text;

  final Function()?onPressed;
   const CustomCheckUpContainer({Key? key, this.text,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height/15,
      width: MediaQuery.of(context).size.width/1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorManager.secondary,
      ),
      child: TextButton(onPressed: onPressed,child: Text(text,
        style: TextStyle(
          fontSize: AppSize.s24,
          color: ColorManager.white,

        ),
      ),),
    );

  }
}
