import 'package:flutter/material.dart';

class ColorManager{
  static Color primary= const Color(0xffECE8DD);
  static Color lightPrimary= const Color(0x80ECE8DD);//50%
  static Color secondary=const Color(0xff85456F);
  static Color darkSecondary=const Color(0xff8D0F62);
  static Color darkPage=const Color(0xffEADECF);
  static Color white=const Color(0xffFFFFFF);
  static Color black=const Color(0xff000000);
  static Color gray=const Color(0x40000000);
  //ممكن نتحكم في الشفافية عن طريق استبدال ال ff ب الرمز المقابل للشفافية من get hup
  //مثلا هنا قمنا بإستبدال ال ff ب 80 لتكون الشفافية 50%
  static Color lightSecondary= const Color(0x8085456F);//50% opacity
  static Color error=const Color(0xffe61f34);


  static Color orange=const Color(0xffF6C34C);

}
