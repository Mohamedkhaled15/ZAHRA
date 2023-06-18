import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/styles_manger.dart';
import '../../core/constant/values_manger.dart';


ThemeData getAppTheme(){
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.secondary,
    primaryColorDark: ColorManager.darkPage,
    disabledColor: ColorManager.gray,
    splashColor: ColorManager.primary,

    // card-view
    cardTheme: CardTheme(
      color: ColorManager.darkPage,
      shadowColor: ColorManager.gray,
      elevation: AppSize.s4,
    ),


    // app bar theme
    appBarTheme: AppBarTheme(centerTitle: true,
    color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightSecondary,
      titleTextStyle: getNormalStyle(color:ColorManager.white ,fontSize: FontSize.s16)
    ),



    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.gray,
      buttonColor: ColorManager.secondary,
      splashColor: ColorManager.lightSecondary,
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getNormalStyle(color: ColorManager.white,fontSize: FontSize.s18), 
          backgroundColor: ColorManager.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s25),

          )


      )
    ),
      //text theme
    textTheme: TextTheme(
      //displayLarge: getLightStyle(color: ColorManager.secondary,fontSize: FontSize.s32),
      subtitle1: getNormalStyle(color: ColorManager.black,fontSize: FontSize.s16),
      caption: getNormalStyle(color: ColorManager.white),
      bodyText1: getNormalStyle(color: ColorManager.gray),
      


  ),





    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding:const EdgeInsets.all(AppPadding.p8),
      hintStyle: getBoldStyle(color: ColorManager.lightSecondary,fontSize: FontSize.s18),
      //label style
      labelStyle: getBoldStyle(color: ColorManager.lightSecondary,fontSize: FontSize.s16),

      errorStyle: getLightStyle(color: ColorManager.error),
      enabledBorder:OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.darkPage,width: AppSize.s2),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s25))
            
      ),
     disabledBorder:OutlineInputBorder(

         borderSide: BorderSide(color: ColorManager.darkPage,width: AppSize.s2),
         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s25))

     ),
     focusedBorder: OutlineInputBorder(
     borderSide: BorderSide(color: ColorManager.darkPage,width: AppSize.s2),
     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s25))),

     errorBorder: OutlineInputBorder(
     borderSide: BorderSide(color: ColorManager.error,width: AppSize.s2),
     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s25))),

    focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: ColorManager.darkSecondary,width: AppSize.s2),
      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s25)))

    )

  );

}