import 'package:flutter/cupertino.dart';
import 'package:zahra/core/constant/values_manger.dart';

import 'colors_manager.dart';

class AppImageAsset {

  static const String rootImages = "assets/images" ;
  // static const String logo  = "$rootImages/logo.png" ;
  static const String onBoardingImageOne    = "$rootImages/on_boarding_one.png" ;
  static const String onBoardingImageTwo    = "$rootImages/on_boarding_two.png" ;
  static const String onBoardingImageThree  = "$rootImages/on_boarding_three.png" ;
  static const String onBoardingImageFour = "$rootImages/on_boarding_four.png" ;
  static const splashImage = "$rootImages/splash.png";
  static const welcomeScreen = "$rootImages/welcomescreen.png";
  static String noNotification="$rootImages/noNotification.png";
  static String doctorLogo="$rootImages/doctor1.png";
  static String medicalCheckupLogo2="$rootImages/medicalCheckup2.png";
  static String medicineLogo="$rootImages/medicine.png";
  static String medicineFollow="$rootImages/medicineFollow.png";
  static String essaysIcon="$rootImages/essaysIcon.png";
  static String medicalCheckupLogo="$rootImages/mc.png";
  static String groupLogo="$rootImages/group.png";
  static String article="$rootImages/article.png";
  static String newI="$rootImages/new.png";
  static String searching="$rootImages/Searching.png";
  static String doctorLogo2="$rootImages/Doctor2.png";
  static String medicine2="$rootImages/medicine2.png";

  static const logo = "$rootImages/Logo.png";
  static const google = "$rootImages/google.png";
  static const faceBook = "$rootImages/facebook.png";
  static const dailyCheckUp = "$rootImages/daily_logo.png";
  static const personChatting = "$rootImages/person_chatting.png";


}

class IconManager{
  static Icon personFill= Icon(CupertinoIcons.person_fill,color: ColorManager.darkSecondary,size: AppSize.s47,);
  static Icon person= Icon(CupertinoIcons.person,color: ColorManager.darkSecondary,size: AppSize.s47,);
  static Icon homeFill= Icon(CupertinoIcons.house_fill,color: ColorManager.darkSecondary,size: AppSize.s47,);
  static Icon home= Icon(CupertinoIcons.house,color: ColorManager.darkSecondary,size: AppSize.s47,);
  static Icon bellFill= Icon(CupertinoIcons.bell_fill,color: ColorManager.darkSecondary,size: AppSize.s47,);
  static Icon bell= Icon(CupertinoIcons.bell,color: ColorManager.darkSecondary,size: AppSize.s47,);
  static Icon drawer= Icon(CupertinoIcons.line_horizontal_3,color: ColorManager.darkSecondary,size: AppSize.s54,);
  static Icon eyesClosed= Icon(CupertinoIcons.eye_slash_fill,color: ColorManager.darkSecondary,size: AppSize.s25,);
  static Icon eyes= Icon(CupertinoIcons.eye,color: ColorManager.darkSecondary,size: AppSize.s25,);

}
