import 'package:flutter/material.dart';
import 'package:zahra/core/constant/colors_manager.dart';
import 'package:zahra/core/constant/font_manager.dart';
import 'package:zahra/core/constant/values_manger.dart';

Widget defaultTextFieldPlane({
  required String labelText,
  required textColor,
  String? hintText,
  Function()? onTapeFun,
  IconData? prefixIconData,
  IconData? suffixIconData,
  Function(String)? onChangeFun,
  Function(String)? onSubmittedFun,
  Function()? suffixPressed,
  Function()? prefixPressed,

  String? Function(String?)? validateFun,
  double radius = 25.0,
}) {
  return TextFormField(
    cursorColor: ColorManager.secondary,
    cursorWidth: 2.5,
    style: defaultTextStyle(color: Colors.black.withOpacity(0.8)),
    decoration: InputDecoration(
      labelText: labelText,
      hintText:hintText ,
      hintStyle: TextStyle(

        fontSize: AppSize.s20,
        fontWeight: FontWeightManager.bold,
        color: ColorManager.gray,
      ),
      isDense: true,
      labelStyle: defaultTextStyle(color: textColor),
      prefixIcon: IconButton(

        color: textColor, onPressed: prefixPressed,
        icon: Icon(prefixIconData,size: 20,          color: textColor.withOpacity(0.6),
        ),
      ),
      suffixIcon: IconButton(
        onPressed: suffixPressed,
        icon: Icon(
          suffixIconData,
          size: 20,
          color: textColor.withOpacity(0.6),
        ),
        // splashColor: Colors.red.withOpacity(0.0),
        // highlightColor: Colors.red.withOpacity(0.0),
      ),

      // suffix: Text(suffixText),
      // suffixText: suffixText,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: textColor),

        borderRadius: BorderRadius.all(Radius.circular(radius),),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(color: textColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color:  ColorManager.secondary),
      ),
    ),
    onTap: onTapeFun,
    onChanged: onChangeFun,
    onFieldSubmitted: onSubmittedFun,
    validator: validateFun,
  );
}
TextStyle defaultTextStyle({
  required Color color,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
  TextDecoration? textDecoration,
  Color? decorationColor,
  double textHeight = 1.15,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    decoration: textDecoration,
    decorationColor: decorationColor,
    height: textHeight,
  );
}