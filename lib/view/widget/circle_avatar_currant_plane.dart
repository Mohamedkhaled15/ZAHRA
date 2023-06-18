import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constant/colors_manager.dart';
import '../screens/add_plane_screen/add_plan_view.dart';

class CircleAvatarCurrentPlaneItem extends StatelessWidget {
  const CircleAvatarCurrentPlaneItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor: ColorManager.secondary,
      radius: 25,
      child: IconButton(onPressed: (){
        Get.to(() =>  AddPlaneView(),
        );
      },icon: Icon(Icons.add,size: 30,color: ColorManager.white,),),
    );
  }
}
