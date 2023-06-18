import 'package:flutter/material.dart';

import '../../component/continue_button.dart';
import '../../component/item_drawer.dart';
import '../../component/page_head.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class CreditPay extends StatelessWidget {
  const CreditPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      endDrawer: Drawer(
    backgroundColor: ColorManager.darkPage,
    child: const ItemDrawer(),
      ),
      body: SafeArea(
        child: ListView(

        children: [
    Head(title:
    AppStrings.creditePay),
    const SizedBox(
        height: 20,
    ),
    Container(
        margin:  const EdgeInsets.symmetric(
          horizontal: AppMargin.m14,),
        width: double.infinity,
        height: 320,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),

                    color: ColorManager.darkSecondary
                ),
                child: Center(
                  child: Text(
                    AppStrings.creditCardLabel,
                    style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s22),),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                  color: ColorManager.darkPage,

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          style: TextStyle(
                              color: ColorManager.darkSecondary,
                              fontSize: FontSize.s22,
                              fontFamily: 'Poppins'),
                          cursorColor: ColorManager.secondary,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
                            labelStyle:
                            TextStyle(color: ColorManager.lightSecondary),
                            fillColor: ColorManager.white,
                            filled: true,
                            hintText:AppStrings.creditNumber,
                          ),
                          textDirection: TextDirection.rtl,

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          style: TextStyle(
                              color: ColorManager.darkSecondary,
                              fontSize: FontSize.s22,
                              fontFamily: 'Poppins'),
                          cursorColor: ColorManager.secondary,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
                            labelStyle:
                            TextStyle(color: ColorManager.lightSecondary),
                            fillColor: ColorManager.white,
                            filled: true,
                            hintText: AppStrings.expiry,


                          ),
                          textDirection: TextDirection.rtl,

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          style: TextStyle(
                              color: ColorManager.darkSecondary,
                              fontSize: FontSize.s22,
                              fontFamily: 'Poppins'),
                          cursorColor: ColorManager.secondary,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
                            labelStyle:
                            TextStyle(color: ColorManager.lightSecondary),
                            fillColor: ColorManager.white,
                            filled: true,
                            hintText: AppStrings.creditOwner,
                          ),

                          textDirection: TextDirection.rtl,

                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
    ),
          SizedBox(
            height: MediaQuery.of(context).size.height/4.5,
          ),
    ContinueButton(
        text: AppStrings.pay,
        routes: Routes.done,

    ),


        ]),
      ),
    );
  }
}
