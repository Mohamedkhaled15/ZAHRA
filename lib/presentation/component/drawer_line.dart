import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';

class DrawerLine extends StatelessWidget {

   DrawerLine( {this.title,this.image});
  late final String? title;
  late final String? image;

  @override
  Widget build(BuildContext context) {
    return  Directionality(

      textDirection: TextDirection.rtl,
      child: ListTile(
        leading: Image.asset(image!,scale: 14,color: ColorManager.darkSecondary,),
        title: Text(title!,style: getBoldStyle(color: ColorManager.darkSecondary,fontSize: FontSize.s24),),
      ),

    );
  }
}
