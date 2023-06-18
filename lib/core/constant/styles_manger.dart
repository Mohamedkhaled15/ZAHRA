import 'package:flutter/material.dart';

import 'font_manager.dart';


TextStyle _getTextStyle(double fontSize ,FontWeight fontWight,Color color){
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.normal
  );
}
//normal style
TextStyle getNormalStyle({double fontSize=FontSize.s20, required Color color}){
  return _getTextStyle(fontSize,FontWeightManager.normal, color);
}
//light style
TextStyle getLightStyle({double fontSize=FontSize.s16, required Color color}){
  return _getTextStyle(fontSize,FontWeightManager.light, color);
}
//bold style
TextStyle getBoldStyle({double fontSize=FontSize.s24, required Color color}){
  return _getTextStyle(fontSize,FontWeightManager.bold, color);
}

