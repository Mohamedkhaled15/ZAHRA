import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zahra/presentation/resources/strings_manager.dart';
import 'package:zahra/presentation/resources/values_manager.dart';


import '../../../../component/item_drawer.dart';
import '../../../../component/page_head.dart';
import '../../../../component/pay_way_card.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/styles_manager.dart';

class CallDetails extends StatefulWidget {

  @override
  State<CallDetails> createState() => _CallDetailsState();
}

class _CallDetailsState extends State<CallDetails> {
  String dropdownValue = 'Option 1';
  String selectedValue = "USA";
  String _selectedPhoneCode = "+20";
  List<String> _phoneCodes = [
    "+20", // Egypt
    "+966", // Saudi Arabia
    "+971", // United Arab Emirates
    "+962", // Jordan
    "+964", // Iraq
    "+961", // Lebanon
    "+968", // Oman
    "+974", // Qatar
    "+963", // Syria
    "+967", // Yemen
  ];
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("1"),value: "+1"),
      DropdownMenuItem(child: Text("Cavvnada"),value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
      DropdownMenuItem(child: Text("England"),value: "England"),
    ];
    return menuItems;
  }
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
            Head(title: AppStrings.callDetails),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(AppStrings.appointmentHint3,style: getLightStyle(color: ColorManager.gray,fontSize: FontSize.s20),textAlign: TextAlign.center,),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                  child: Container(
                    padding:const EdgeInsets.symmetric(horizontal: AppPadding.p25) ,
                    height: 220,
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
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(AppStrings.name,style: getNormalStyle(color: ColorManager.darkSecondary),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                          child: TextFormField(

                            style: TextStyle(
                                color: ColorManager.darkSecondary,
                                fontSize: FontSize.s22,
                                fontFamily: 'Poppins'),
                            cursorColor: ColorManager.secondary,
                            decoration: InputDecoration(
                              labelStyle:
                              TextStyle(color: ColorManager.lightSecondary),
                              fillColor: ColorManager.white,
                              filled: true,
                            ),
                            textDirection: TextDirection.rtl,

                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(AppStrings.phoneNumber,style: getNormalStyle(color: ColorManager.darkSecondary),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                              // Add more formatters as needed
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a phone number';
                              } else if (value.length < 10) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // Do something with the phone number value
                            },
                            style: TextStyle(
                                color: ColorManager.darkSecondary,
                                fontSize: FontSize.s22,
                                fontFamily: 'Poppins'),
                            cursorColor: ColorManager.darkSecondary,
                            decoration: InputDecoration(
                              labelStyle:
                              TextStyle(color: ColorManager.darkSecondary),
                              fillColor: ColorManager.white,
                              filled: true,
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children:  [
                                SizedBox(width: 20,),
                                DropdownButton(

                                  underline: Container(),
                                  icon: IconManager.dArrow,
                                  style: getLightStyle(color: ColorManager.darkSecondary,fontSize: FontSize.s22),
                                  value: _selectedPhoneCode,
                                  items: _phoneCodes.map((String phoneCode) {
                                    return DropdownMenuItem<String>(
                                      value: phoneCode,
                                      child: Text(phoneCode),
                                    );
                                  }).toList(),
                                  onChanged: (String?newValue) {

                                      setState(() {
                                        _selectedPhoneCode =  newValue!;
                                      });

                                  },
                                ),

                              ],)
                            ),

                            textDirection: TextDirection.rtl,


                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    AppStrings.choseWayToPay,
                    style:getBoldStyle(
                        color: ColorManager.darkSecondary,
                        fontSize: AppSize.s22),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                PayCard(
                  image: ImageAssets.fawry,
                  title:AppStrings.fawry ,
                  subtitle:AppStrings.fawrySubTitle ,
                   route: Routes.payFawry,

                ),
                const SizedBox(
                  height: 20,
                ),
                PayCard(
                  image: ImageAssets.creditCard,
                  title:AppStrings.creditCard ,
                  subtitle:AppStrings.creditSubTitle ,
                   route: Routes.creditPay,

                ),


          ]
          ),
        )
    );
  }
}
