import 'package:flutter/material.dart';

import '../../core/constant/font_manager.dart';
import '../../core/constant/values_manger.dart';



TextStyle _getTextStyle(double fontSize ,FontWeight fontWight,Color color,double height){
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.normal,
      height: height,
  );
}
//normal style
TextStyle getNormalStyle({double fontSize=FontSize.s20, required Color color,double height=AppSize.s1}){
  return _getTextStyle(fontSize,FontWeightManager.bold, color,1.5);
}
//light style
TextStyle getLightStyle({double fontSize=FontSize.s16, required Color color,double height=AppSize.s1}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color,1.5);
} //bold style
  TextStyle getBoldStyle({double fontSize=FontSize.s24, required Color color,double height=AppSize.s1}){
    return _getTextStyle(fontSize,FontWeightManager.bold, color,1.5);
}