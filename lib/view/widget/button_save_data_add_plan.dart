import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/component/default_button.dart';
import '../../core/constant/font_manager.dart';
import '../screens/add_plane_screen/current_plane.dart';

class ButtonSaveDataAddPlaneItem extends StatelessWidget {
  const ButtonSaveDataAddPlaneItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return          Center(
      child: defaultButton(
        text: "حفظ",
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 15,
        fontWight: FontWeightManager.bold,
        onTap: () {
          Get.to(
                () => const CurrentPlan(),
          );
        },
        backGround: const Color(0xff85456F),
      ),
    );
  }
}
