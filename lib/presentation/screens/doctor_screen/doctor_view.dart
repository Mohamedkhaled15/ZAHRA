import 'package:flutter/material.dart';
import 'package:zahra/presentation/component/item_drawer.dart';
import 'package:zahra/presentation/resources/assets_manager.dart';
import 'package:zahra/presentation/resources/color_manager.dart';
import 'package:zahra/presentation/resources/styles_manager.dart';
import 'package:zahra/presentation/screens/doctor_screen/tabs/private_doctor/private_doctor.dart';
import 'package:zahra/presentation/screens/doctor_screen/tabs/reversation/reservation.dart';
import 'package:zahra/presentation/screens/doctor_screen/tabs/search_for_doctor.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        // appBar: AppBar(),
        backgroundColor: ColorManager.primary,
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppPadding.p18, right: AppPadding.p18),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Builder(builder: (context) {
                    return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: IconManager.drawer);
                  }),
                ),
                Container(

                  margin: const EdgeInsets.symmetric(vertical: AppMargin.m10),
                  height: MediaQuery.of(context).size.height / 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s32),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.gray, //New
                          blurRadius: 1.0,
                          offset:Offset (1,1),
                          spreadRadius: 1
                        )
                      ],
                      color: ColorManager.darkPage),
                  child:  TabBar(

                      indicator: BoxDecoration(
                          color: ColorManager.darkSecondary,

                          borderRadius:  BorderRadius.circular(30.0)
                      ) ,

                      labelColor: ColorManager.white,


                      isScrollable: false,



                      labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                      labelStyle: getNormalStyle(color: ColorManager.secondary,fontSize: FontSize.s18,height: 2),
                      unselectedLabelColor: ColorManager.darkSecondary,
                      tabs:const [

                   Tab( text:AppStrings.doc3),
                   Tab( text:AppStrings.doc2),
                   Tab( text:AppStrings.doc1,height: 55,),



                    //  TabBar(tabs: ),
                  ]),
                ),
                 const Expanded(
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                        children: [
                          Reservation(),
                          PrivateDoctor(),
                          SearchForDoctorView(),

                        ]
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
