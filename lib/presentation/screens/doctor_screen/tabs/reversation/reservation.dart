import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:zahra/presentation/screens/doctor_screen/tabs/reversation/reverse_controller.dart';

import '../../../../component/reserve_card.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
 // bool isCanceled = false;
  ReverseController controller=ReverseController();
@override
  void setState(VoidCallback fn) {

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p2, right: AppPadding.p2),
      child: Column(
        children: [
          Center(
            child: Text(
              AppStrings.appointment,
              style: getNormalStyle(color: ColorManager.darkSecondary),
            ),
          ),
          Expanded(
              child: ListView.builder(

                itemCount: controller.doctorCard['image']?.length,
            itemBuilder: (context, index) => Container(
              // padding: const EdgeInsets.only(top: AppPadding.p14),
              margin: const EdgeInsets.symmetric(
                  horizontal: AppMargin.m4, vertical: AppMargin.m10),
              width: double.infinity,
              height: controller.doctorCard['isCanceled']![index]
                  ? 240
                  : 280,
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
              child: Expanded(
                child: Column(
                  children: [
                    controller.doctorCard['isCanceled']![index]
                        ? const SizedBox(
                            height: 1,
                          )
                        : Container(
                            width: double.infinity,
                            height: AppSize.s41,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              color: ColorManager.darkSecondary,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  AppStrings.cancelAppointment2,
                                  style: getLightStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s16),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 30,
                                ),
                                Image(
                                  image: AssetImage(
                                    ImageAssets.remove,
                                  ),
                                  color: ColorManager.white,
                                  height: 25,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                          ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //canele button
                          Container(
                            height:30,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: ColorManager.darkSecondary,
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  controller.doctorCard['isCanceled']![index] = !controller.doctorCard['isCanceled']![index];
                                  controller.doctorCard['isCanceled']![index]
                                      ? Navigator.pushNamed(context, Routes.appointment):null;
                                });
                              },
                              child: Center(
                                child: Text(
                                  controller.doctorCard['isCanceled']![index]
                                      ? AppStrings.cancelAppointment
                                      : AppStrings.newAppointment,


                                  style: getLightStyle(
                                      color: ColorManager.white,
                                      fontSize: 10,
                                      height: 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width:20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: AppPadding.p14),
                            child: Text.rich(
                              textAlign: TextAlign.end,
                              TextSpan(children: [
                                TextSpan(
                                  text:  controller.doctorCard['name']![index],
                                  style: getNormalStyle(
                                      fontSize: FontSize.s16,
                                      color: ColorManager.darkSecondary,
                                      height: 3),

                                ),
                                const TextSpan(text: '\n'),
                                TextSpan(
                                    text: controller.doctorCard['description']![index],
                                    style: getLightStyle(
                                      color: ColorManager.secondary,
                                      fontSize: FontSize.s10,
                                    )),
                              ]),
                              style: const TextStyle(height: 1),
                            ),
                          ),
                          const SizedBox(
                            width:20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: AppPadding.p14,right: 5),
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
                                imagePath: controller.doctorCard['image']![index],
                              ),

                            ),
                          ),
                          const SizedBox(
                            width: 1,
                          )
                        ],
                      ),
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
                          child: Text(
                            controller.doctorCard['isCanceled']![index]
                                ? AppStrings.docAppointment
                                : AppStrings.call,
                            style: getLightStyle(
                                color: ColorManager.secondary,
                                fontSize: FontSize.s12),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            controller.doctorCard['location']![index],
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //2--------------------------------------
                        Text(
                    controller.doctorCard['cost']![index],
                          style: getLightStyle(
                              color: ColorManager.secondary,
                              fontSize: FontSize.s12),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Image.asset(
                          ImageAssets.dollar,
                          color: ColorManager.darkSecondary,
                          scale: 17,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end
                      ,
                      children: [
                        //3----------------------------------------------------------
                        Text(
                    controller.doctorCard['time']![index],
                          style: getLightStyle(
                              color: ColorManager.secondary,
                              fontSize: FontSize.s12),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Image.asset(
                          ImageAssets.clock,
                          color: ColorManager.darkSecondary,
                          scale: 22,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                  ],
                ),
              ),
            ),
          )
          )
        ],
      ),
    );
  }
}
