import 'package:flutter/material.dart';
import 'package:zahra/core/constant/colors_manager.dart';

Widget defaultTextField({
  TextEditingController? controller,
  required String labelText,
  // required String suffixText,
  required textColor,
  required IconData prefixIconData,
  required TextInputType keyboardType,
  Function()? onTapeFun,
  Function(String)? onChangeFun,
  Function(String)? onSubmittedFun,
  String? Function(String?)? validateFun,
  bool readOnly = false,
  bool obscureText = false,
  String obscuringChr = '.',
  IconData? suffixIconData,
  Function()? suffixPressed,
  double radius = 25.0,
  String? initialValue,
}) {
  return TextFormField(

    cursorColor: ColorManager.secondary,
    cursorWidth: 2.5,
    controller: controller,
    initialValue: initialValue,
    style: defaultTextStyle(color: Colors.black.withOpacity(0.8)),
    decoration: InputDecoration(
      labelText: labelText,
      isDense: true,
      labelStyle: defaultTextStyle(color: textColor),
      prefixIcon: Icon(
        prefixIconData,
        color: textColor.withOpacity(0.6),
      ),

      suffixIcon: IconButton(
        onPressed: suffixPressed,
        icon: Icon(
          suffixIconData,
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
    keyboardType: keyboardType,
    onTap: onTapeFun,
    onChanged: onChangeFun,
    onFieldSubmitted: onSubmittedFun,
    readOnly: readOnly,
    validator: validateFun,
    obscureText: obscureText, //To hide the password
    obscuringCharacter: obscuringChr,
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