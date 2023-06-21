import 'package:flutter/material.dart';
import 'package:zahra/presentation/component/calender.dart';
import 'package:zahra/presentation/resources/routes_manager.dart';
import 'package:zahra/presentation/screens/appointment_screen/appointment_controller.dart';
import '../../component/appointment_card.dart';
import '../../component/item_drawer.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../doctor_screen/tabs/reversation/reverse_controller.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {

  AppointmentController controller=AppointmentController();
  DateTime _selectedDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      endDrawer: Drawer(
        backgroundColor: ColorManager.darkPage,
        child: const ItemDrawer(),
      ),
      body:SafeArea(
        child: ListView(

          children: [
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 6/2,
                  child: Container(

                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      boxShadow: [
                        BoxShadow(
                          // color: ColorManager.primary,
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                          // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: AppPadding.p14),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Builder(builder: (context) {
                              return GestureDetector(
                                  onTap: () {
                                    Scaffold.of(context).openEndDrawer();
                                  },
                                  child: IconManager.drawer);
                            }),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          AppStrings.appointmentBooking,
                          style:getBoldStyle(
                              color: ColorManager.darkSecondary,
                              fontSize: AppSize.s32),
                        ),


                      ],
                    ),

                  ),
                ),
                 AppointmentCard(),


                SizedBox(
                  height: MediaQuery.of(context).size.height/17,
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: AppPadding.p14),
                        width: MediaQuery.of(context).size.width/2.2,
                        decoration:  BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: ColorManager.gray, //New
                                  blurRadius: 2.0,
                                  offset: const Offset(1, 1),
                                  spreadRadius: 2
                              )
                            ],
                          color: ColorManager.darkPage,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),


                            )
                        ),
                          child: TextButton(onPressed: (){
                            Navigator.pushNamed(context, Routes.callDetails);
                          }, child: Text(AppStrings.phoneCall,style: getNormalStyle(color: ColorManager.darkSecondary,fontSize: FontSize.s18,))),),

                      Container(
                        margin: const EdgeInsets.only(right: AppPadding.p14),
                          decoration:  BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: ColorManager.gray, //New
                                    blurRadius: 2.0,
                                    offset: const Offset(1, 1),
                                    spreadRadius: 2
                                )
                              ],
                              color: ColorManager.darkSecondary,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),


                              )
                          ),
                          width: MediaQuery.of(context).size.width/2.2,
                          child: TextButton(onPressed: (){
                            Navigator.pushNamed(context, Routes.reservationConfirm);
                            
                          }, child: Text(AppStrings.bookIn,style: getNormalStyle(color: ColorManager.white,fontSize: FontSize.s18),)))
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppPadding.p14,
                ),
                Center(child:
                Text(AppStrings.chose,style: getBoldStyle(color: ColorManager.darkSecondary),),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){},
                        icon: IconManager.lArrow,
                         ),
                    TextButton(onPressed: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Calendar(
                              label: 'Date and Time',
                              initialDateTime:_selectedDateTime ,
                              onDateTimeChanged: (newDateTime ) { setState(() {
                                _selectedDateTime = newDateTime;
                              }); },),
                            actions: [
                              TextButton(
                                child: const Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();

                                },
                              ),
                            ],
                          );
                        },
                      );

                    }, child: Text(AppStrings.choseDateTime,style: getLightStyle(color: ColorManager.darkSecondary),),
                    ),
                    IconButton(

                      onPressed: (){},
                      icon: IconManager.rArrow,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                  height: MediaQuery.of(context).size.height/4,
                  width: double.infinity,
                  child: GridView.builder(

                    shrinkWrap: false,

                    itemCount: 6,

                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: AppCount.n2,
                      crossAxisSpacing:AppSize.s10,
                      mainAxisSpacing: AppSize.s10,
                      mainAxisExtent: 47,
                    ) ,
                    itemBuilder:(context,index)=> Container(
                      height: 30,
                      width: 40,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorManager.white
                      ) ,
                      child: Center(child: Text(controller.dates[index],style: getNormalStyle(color: ColorManager.darkSecondary),)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
