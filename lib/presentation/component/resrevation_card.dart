import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:zahra/presentation/component/variables.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../screens/appointment_screen/appointment_controller.dart';
import '../screens/doctor_screen/tabs/reversation/reverse_controller.dart';

class ReservationCard extends StatefulWidget {
   final String? title;

  const ReservationCard({super.key, this.title});

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
   ReverseController controller = ReverseController();
   AppointmentController controller2=AppointmentController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   const EdgeInsets.symmetric(
          horizontal: AppPadding.p8),
      child: AspectRatio(
        aspectRatio: 3.4/3,
        child: Padding(
          padding:  const EdgeInsets.symmetric(
              vertical: AppPadding.p8),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: AppPadding.p14),
                margin: const EdgeInsets.symmetric(
                  horizontal: AppMargin.m4,),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),

                    color: ColorManager.darkSecondary
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        widget.title!,
                        style: getNormalStyle(color: ColorManager.white),

                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(controller2.dates[selectedDate],style: getLightStyle(color: ColorManager.white,fontSize:FontSize.s16 ),),
                        Text(AppStrings.month,style: getLightStyle(color: ColorManager.white,fontSize:FontSize.s16),),
                        Text(AppStrings.day,style: getLightStyle(color: ColorManager.white,fontSize:FontSize.s16),),

                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: AppPadding.p14),
                margin: const EdgeInsets.symmetric(
                  horizontal: AppMargin.m4,),
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                  color: ColorManager.darkPage,

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
                              text: controller.doctorCard['name']![selectedIndex],
                              style: getNormalStyle(
                                  fontSize: FontSize.s20,
                                  color: ColorManager.darkSecondary,
                                  height: 3),
                            ),
                            const TextSpan(
                                text: "\n"

                            ),
                            TextSpan(
                                text: controller.doctorCard['description']![selectedIndex],

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
                            radius: 30,
                            avatarType: AvatarType.CIRCLE,
                            imagePath:controller.doctorCard['image']?[selectedIndex],

                          ),
                        ),
                      ],
                    ),
                    //Stare**********
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 3.2),
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) =>
                            Image.asset(ImageAssets.star1, scale: 9),
                      ),
                    ),
//---------------------------------------------------------------------------------
                    Divider(
                      endIndent: MediaQuery.of(context).size.width/9,
                      indent: MediaQuery.of(context).size.width/9,
                      thickness: 1,

                      color: ColorManager.darkSecondary,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/120,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(controller.doctorCard['specialization']![selectedIndex],


                          style: getLightStyle(
                              color: ColorManager.secondary, fontSize: FontSize.s12),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/20,),
                        Image.asset(
                          ImageAssets.sth,
                          color: ColorManager.darkSecondary,
                          scale: 5,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/8,)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.doctorCard['location']![selectedIndex],
                          style: getLightStyle(
                              color: ColorManager.secondary, fontSize: FontSize.s12),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/20,),
                        Image.asset(
                          ImageAssets.loc,
                          color: ColorManager.darkSecondary,
                          scale: 5,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/8,)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.doctorCard['cost']![selectedIndex],
                          style: getLightStyle(
                              color: ColorManager.secondary, fontSize: FontSize.s12),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/20,),
                        Image.asset(
                          ImageAssets.dollar,
                          color: ColorManager.darkSecondary,
                          scale: 20,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/8,),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/100,),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
