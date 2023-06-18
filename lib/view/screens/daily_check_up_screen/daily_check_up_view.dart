import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zahra/view/screens/daily_check_up_screen/summary_check_up.dart';

import '../../../controller/daily_check_up_controller.dart';
import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/font_manager.dart';
import '../../../core/constant/image_assets_manager.dart';
import '../../../core/constant/strings_manger.dart';
import '../../../core/constant/values_manger.dart';
import '../../widget/daily_chec_up_container.dart';
import '../../widget/item_drawer.dart';
import '../../widget/item_drop_down_menu.dart';
import '../add_plane_screen/add_plan_view.dart';
import 'chating_check_up.dart';

class DalyCheckupView extends StatefulWidget {
  const DalyCheckupView({Key? key}) : super(key: key);

  @override
  State<DalyCheckupView> createState() => _DalyCheckupViewState();
}

class _DalyCheckupViewState extends State<DalyCheckupView> {

  var  selectedYears = "2023";
  var  selectedMonths = "يناير";
  var  selectedPlane = "شهري";

  List<String> itemsYears =["2023","2022","2021","2020",];
  List<String> itemsMonths =["يناير","فبراير","مارس","ابريل",];
  List<String> itemsPlane =["شهري","يومي","اسبوعي","تخصيص",];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:Scaffold(
        backgroundColor: ColorManager.primary,
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),
        ),
        body: Padding(padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const ItemDropDownMenu(text: AppStrings.dailyCheckUp),
             CustomCheckUpContainer(text: "الاحد 2023/1/1",onPressed:  (){
               Get.to(() =>  const SummaryCheckUpDaily(),
               );
             },),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
             CustomCheckUpContainer(text: "الاحد 2023/1/1",
            onPressed: (){
              Get.to(() =>  const ChattingDailyCheckUp(),
              );
            },

            ),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            const CustomCheckUpContainer(text: "الاحد 2023/1/1",),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            const CustomCheckUpContainer(text: "الاحد 2023/1/1",),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            const CustomCheckUpContainer(text: "الاحد 2023/1/1",),
// DropdownButton(
//   value: selected,
//     items: itemDropped.map((item) =>
//     DropdownMenuItem(
//       value: item,child: Text(item),)).toList() ,
//
//
//     onChanged: (value){
//       selected = value;
//
//       setState(() {
//     });
//     }
//
// ),

// DropdownButton(
//     items: ['ENG','AR','FR','ESP'].map((e) => DropdownMenuItem(value: e,child: Text("$e",style: TextStyle(
//       fontSize: AppSize.s18,color: ColorManager.orange
//     ),),)).toList(),
//     onChanged: (val){
//       setState(() {
//
//         selectItem = val.toString() as List<String>;
//       });
//     },
//   // value: selectItem,
// ),
          ],
        ),),
      ),
    );
  }
}
