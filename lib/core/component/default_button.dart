import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zahra/core/constant/values_manger.dart';


Widget defaultButton({
  required double width,
  required double height,
  required FontWeight fontWight,
   Color? backGround,
  required String text,
  required Function()? onTap,

})=> Container(
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color:   backGround,

  ),
  width: width,
  child: InkWell( onTap:onTap , child: Center(
    child: Text(text,style: const TextStyle(
      color: Colors.white,
      fontSize: AppSize.s24
      ,
    ),),
  )),
);