import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zahra/presentation/resources/color_manager.dart';


import '../../../core/constant/strings_manger.dart';
import '../../../view/screens/daily_check_up_screen/chating_check_up.dart';
import '../../../view/screens/daily_check_up_screen/summary_check_up.dart';
import '../../../view/widget/daily_chec_up_container.dart';
import '../../../view/widget/item_drop_down_menu.dart';
import '../../component/item_drawer.dart';

class DalyCheckupView extends StatelessWidget {
  const DalyCheckupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
