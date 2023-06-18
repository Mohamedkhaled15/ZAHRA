import 'package:flutter/material.dart';
import 'package:zahra/presentation/resources/styles_manager.dart';


import '../resources/color_manager.dart';
import '../resources/values_manager.dart';
import '../screens/home_screen/home_controller.dart';

class ItemHome extends StatelessWidget {

 int? index;
 HomeController? controller;

ItemHome( HomeController this.controller,int this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      Navigator.pushNamed(context, controller!.nav[index!]);

      },
      child: Container(
        height: AppSize.s125,
        width: AppSize.s125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s25),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 4),
              // changes position of shadow
            ),
          ],

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(controller!.img[index!]),
            Text(controller!.label[index!],
              style: getNormalStyle(color:ColorManager.darkSecondary),)
          ],
        ),
      ),
    );
  }
}
