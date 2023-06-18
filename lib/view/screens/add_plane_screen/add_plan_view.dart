import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/component/default_buttom_plane.dart';
import '../../../core/component/default_button.dart';
import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/font_manager.dart';
import '../../../core/constant/image_assets_manager.dart';
import '../../../core/constant/strings_manger.dart';
import '../../../core/constant/values_manger.dart';
import '../../widget/appoinment_first_dose.dart';
import '../../widget/button_save_data_add_plan.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/dosingPattern.dart';
import '../../widget/duration_treatment.dart';
import '../../widget/item_drawer.dart';
import '../before_plan_screen/before_plane_view.dart';
import 'current_plane.dart';

class AddPlaneView extends StatefulWidget {
  AddPlaneView({Key? key}) : super(key: key);

  @override
  State<AddPlaneView> createState() => _AddPlaneViewState();
}

class _AddPlaneViewState extends State<AddPlaneView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime dateTime = DateTime.now();
  String? radioPattern;
  String? radioTreatment;


  bool clickText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 20),
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
            Text(
              AppStrings.addPlane,
              style: TextStyle(
                color: ColorManager.secondary,
                fontWeight: FontWeightManager.bold,
                fontSize: AppSize.s33,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
                margin: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height / 1,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorManager.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.namePlane,
                              style: TextStyle(
                                  fontSize: AppSize.s22,
                                  color: ColorManager.secondary,
                                  fontWeight: FontWeightManager.bold),
                            ),
                            defaultTextFieldPlane(
                              labelText: "",
                              textColor: ColorManager.secondary,
                              hintText: "خطة العلاج الشهرية",
                            ),
                            Text(
                              AppStrings.nameMedicine,
                              style: TextStyle(
                                  fontSize: AppSize.s22,
                                  color: ColorManager.secondary,
                                  fontWeight: FontWeightManager.bold),
                            ),
                            defaultTextFieldPlane(
                              labelText: "",
                              textColor: ColorManager.secondary,
                              hintText: "اسم الدواء",
                            ),
                            Text(
                              AppStrings.numberDose,
                              style: TextStyle(
                                  fontSize: AppSize.s22,
                                  color: ColorManager.secondary,
                                  fontWeight: FontWeightManager.bold),
                            ),
                            defaultTextFieldPlane(
                                labelText: "",
                                textColor: ColorManager.secondary,
                                prefixIconData: Icons.add_circle,
                                prefixPressed: () {},
                                suffixIconData: Icons.remove_circle,
                                hintText: "جرعة واحدة",
                                suffixPressed: () {}),
                            const DosingPatternItem(),
                            Text(
                              AppStrings.appointmentFirstDose,
                              style: TextStyle(
                                  color: ColorManager.secondary,
                                  fontSize: AppSize.s20,
                                  fontWeight: FontWeightManager.bold),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 150,
                            ),
                            const AppointmentFirstDoseItem(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 35,
                            ),
                            const DurationTreatmentItem(),
                            // Center(
                            //   child: Container(
                            //     height: MediaQuery.of(context).size.height/15,
                            //     width: MediaQuery.of(context).size.width/5.5,
                            //     decoration: BoxDecoration(
                            //       color: ColorManager.white,
                            //       borderRadius: BorderRadius.circular(20),
                            //     ),
                            //     // child: Center(child: Text("${dateTime.day}/${dateTime.month}/${dateTime.year}"),
                            //     //
                            //     // ),
                            //
                            //   ),
                            // ),

                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_circle,
                                      color: ColorManager.secondary,
                                      size: 20,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                40),
                                    Text(
                                      "اضافة دواء اخر",
                                      style: TextStyle(
                                          color: ColorManager.secondary,
                                          fontSize: AppSize.s18,
                                          fontWeight: FontWeightManager.bold),
                                    ),
                                  ],
                                )),
                            const ButtonSaveDataAddPlaneItem(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 17,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
