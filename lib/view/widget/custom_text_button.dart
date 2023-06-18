import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zahra/core/constant/colors_manager.dart';
import 'package:zahra/core/constant/values_manger.dart';
import 'package:zahra/view/screens/log_in_screen/log_in_screen.dart';

import '../../core/constant/strings_manger.dart';
import '../screens/register_screen/register_view.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return  Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height /16,
      width: MediaQuery.of(context).size.width /1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorManager.secondary,
      ),
      child: TextButton(onPressed: () {
        Get.to(() =>  LogIn(),
        );
      },
        child:  const   Text(AppStrings.textButtonStarting,

          style: TextStyle(
          color: Colors.white,
            fontSize: AppSize.s18,

        ),),

      ),
    );
  }
}
