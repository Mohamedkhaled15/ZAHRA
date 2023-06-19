import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zahra/core/constant/colors_manager.dart';
import 'package:zahra/core/constant/font_manager.dart';
import 'package:zahra/core/constant/strings_manger.dart';
import 'package:zahra/core/constant/values_manger.dart';

import '../../../core/component/default_button.dart';
import '../../../core/constant/image_assets_manager.dart';

import '../../../presentation/component/item_drawer.dart';
import '../add_plane_screen/add_plan_view.dart';
import '../home_screen/home_view.dart';
import '../notification_screen/notification_view.dart';
import '../profile_screen/profile_view.dart';

class MedicineView extends StatefulWidget {
   MedicineView({Key? key}) : super(key: key);

  @override
  State<MedicineView> createState() => _MedicineViewState();
}

class _MedicineViewState extends State<MedicineView> {
  int currentIndex=1;

  List<Widget> screens=[
  const NotificationView(),
  HomeView(),
  const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),

        ),
        body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25,top: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: Builder(
                    builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: IconManager.drawer
                      );
                    }
                ),
              ),
            ),
            Text(AppStrings.medicine,style: TextStyle(
              color: ColorManager.secondary,
              fontWeight: FontWeightManager.bold,
              fontSize: AppSize.s33,
            ),),
            Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                color: ColorManager.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(AppImageAsset.medicineFollow,),
            ),
            defaultButton(
              fontWight: FontWeightManager.bold,
              text:AppStrings.textMedicineFollow,
              onTap: (){
                Get.to(
                      () =>  AddPlaneView(),
                );
              },
               width: MediaQuery.of(context).size.width/1.3,
              height:MediaQuery.of(context).size.height/16,
              backGround: ColorManager.secondary,
            ),

          ],
        ),


      ),
    );
  }
}
