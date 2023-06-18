import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:zahra/presentation/resources/font_manager.dart';
import 'package:zahra/presentation/resources/strings_manager.dart';
import 'package:zahra/presentation/resources/styles_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class ReserveCard extends StatefulWidget {
  const ReserveCard({Key? key}) : super(key: key);

  @override
  State<ReserveCard> createState() => _ReserveCardState();
}

class _ReserveCardState extends State<ReserveCard> {
  bool isCanceled=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: AppPadding.p14),
      margin:  const EdgeInsets.symmetric(
          horizontal: AppMargin.m4, vertical: AppMargin.m10),
      width: double.infinity,
      height:isCanceled? MediaQuery.of(context).size.height / 3.2
          :MediaQuery.of(context).size.height/3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorManager.darkPage,
        boxShadow: [
          BoxShadow(
              color: ColorManager.gray, //New
              blurRadius: 1.0,
              offset: Offset(1, 1),
              spreadRadius: 1)
        ],
      ),
      child: Column(
        children: [
          isCanceled?const SizedBox(height: 1,):Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)),
              color: ColorManager.darkSecondary,
            ),
            child:
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                ),
                const Spacer(),
                Text(AppStrings.cancelAppointment2,
                  style: getLightStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s16),),
                SizedBox(
                  width: MediaQuery.of(context).size.width/30,
                ),
                Image(
                  image: AssetImage(ImageAssets.remove,),
                  color: ColorManager.white,
                  height: 25,

                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/11,
                ),
              ],),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //canele button
              Container(
                height: MediaQuery.of(context).size.height / 30,
                width: MediaQuery.of(context).size.width / 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorManager.darkSecondary,
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isCanceled=!isCanceled;
                    });
                  },
                  child: Center(
                    child: Text(
                      isCanceled?AppStrings.cancelAppointment:AppStrings.newAppointment,
                      style: getLightStyle(
                          color: ColorManager.white,
                          fontSize: 10,
                          height: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 16,
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p14),
                child: Text.rich(
                  textAlign: TextAlign.end,
                  TextSpan(children: [
                    TextSpan(
                      text: AppStrings.docName,
                      style: getNormalStyle(
                          fontSize: FontSize.s16,
                          color: ColorManager.darkSecondary,
                          height: 3),
                    ),
                    TextSpan(
                        text: AppStrings.docShortDescription,
                        style: getLightStyle(
                          color: ColorManager.secondary,
                          fontSize: FontSize.s10,
                        )),
                  ]),
                  style: const TextStyle(height: 1),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 16,
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p14),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: ColorManager.darkPage,
                    boxShadow: [
                      BoxShadow(
                          color: ColorManager.gray, //New
                          blurRadius: 1.0,
                          offset: const Offset(1, 1),
                          spreadRadius: 1)
                    ],
                  ),
                  child: AvatarView(
                    radius: 30,
                    avatarType: AvatarType.CIRCLE,
                    imagePath: ImageAssets.me,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            endIndent: MediaQuery.of(context).size.width / 9,
            indent: MediaQuery.of(context).size.width / 9,
            thickness: 1,
            color: ColorManager.darkSecondary,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(isCanceled?AppStrings.docAppointment:AppStrings.call,style: getLightStyle(
                    color: ColorManager.secondary,fontSize: FontSize.s12),),
              ),
              SizedBox(width: MediaQuery.of(context).size.width/6,),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.docSpic,
                style: getLightStyle(
                    color: ColorManager.secondary,
                    fontSize: FontSize.s12),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              Image.asset(
                ImageAssets.sth,
                color: ColorManager.darkSecondary,
                scale: 5,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.docSpic,
                style: getLightStyle(
                    color: ColorManager.secondary,
                    fontSize: FontSize.s12),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              Image.asset(
                ImageAssets.loc,
                color: ColorManager.darkSecondary,
                scale: 5,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.docSpic,
                style: getLightStyle(
                    color: ColorManager.secondary,
                    fontSize: FontSize.s12),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              Image.asset(
                ImageAssets.loc,
                color: ColorManager.darkSecondary,
                scale: 5,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),


        ],
      ),
    );
  }
}
