import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: AppPadding.p14),
      margin: const EdgeInsets.symmetric(
          horizontal: AppMargin.m4, vertical: AppMargin.m10),
      width: double.infinity,
      height: 260,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                textAlign: TextAlign.end,
                TextSpan(children: [
                  TextSpan(
                    text: AppStrings.docName,
                    style: getBoldStyle(
                        fontSize: FontSize.s20,
                        color: ColorManager.darkSecondary,
                        height: 3),
                  ),
                  TextSpan(
                      text: AppStrings.docDescription,
                      style: getLightStyle(
                        color: ColorManager.secondary,
                        fontSize: FontSize.s12,
                      )),
                ]),
                style: const TextStyle(height: 1),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 16,
              ),
              Container(
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
                  radius: 40,
                  avatarType: AvatarType.CIRCLE,
                  imagePath: ImageAssets.me,
                ),
              ),
            ],
          ),
          //Stare**********
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
            child: ListView.builder(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 3.7),
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) =>
                  Image.asset(ImageAssets.star1, scale: 8),
            ),
          ),

          Divider(
            endIndent: MediaQuery.of(context).size.width/9,
            indent: MediaQuery.of(context).size.width/9,
            thickness: 1,

            color: ColorManager.darkSecondary,
          ),
          SizedBox(height: MediaQuery.of(context).size.height/120,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.docSpic,
                style: getLightStyle(
                    color: ColorManager.secondary, fontSize: FontSize.s12),
              ),
              SizedBox(width: MediaQuery.of(context).size.width/20,),
              Image.asset(
                ImageAssets.sth,
                color: ColorManager.darkSecondary,
                scale: 5,
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height/60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.docSpic,
                style: getLightStyle(
                    color: ColorManager.secondary, fontSize: FontSize.s12),
              ),
              SizedBox(width: MediaQuery.of(context).size.width/20,),
              Image.asset(
                ImageAssets.loc,
                color: ColorManager.darkSecondary,
                scale: 5,
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height/100,),

          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height/17,
              width: double.infinity,
              decoration: BoxDecoration(

                  color: ColorManager.secondary,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSize.s25, ),bottomRight:Radius.circular(AppSize.s25, ) )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context,Routes.appointment);
                  }, child: Text(AppStrings.bookNow,style: getNormalStyle(color: ColorManager.white),)),
                  const VerticalDivider(
                    width: 60,
                    thickness: 3,
                  ),
                  TextButton(onPressed: (){}, child: Text(AppStrings.sendQuestion,style: getNormalStyle(color: ColorManager.white),))
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
