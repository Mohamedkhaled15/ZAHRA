import 'package:flutter/material.dart';
import 'package:zahra/core/constant/values_manger.dart';

import '../../controller/home_controller.dart';
import '../../core/constant/colors_manager.dart';
import '../../core/constant/styles_manger.dart';

class ItemHome extends StatelessWidget {

  ItemHome( HomeController this.controller,int this.index, {super.key});

  int? index;
  HomeController? controller;
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
