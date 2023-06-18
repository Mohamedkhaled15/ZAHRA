import 'package:flutter/material.dart';
import 'package:zahra/core/constant/font_manager.dart';
import 'package:zahra/core/constant/values_manger.dart';

import '../../controller/item_radio_controller.dart';
import '../../core/constant/colors_manager.dart';

class ItemRadio extends StatefulWidget {
  const ItemRadio({Key? key, this.value, this.controller,this.text1,this.text3,this.text2}) : super(key: key);
  final int ? value;
  // final int? groupValue;
  final ItemRadioController? controller;
  final String? text1;
  final String ?text2;
  final String ?text3;

  @override
  State<ItemRadio> createState() => _ItemRadioState();
}

class _ItemRadioState extends State<ItemRadio> {
  final controller = ItemRadioController();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Radio(
                activeColor: ColorManager.secondary,
                value: 0,
                groupValue: controller.isSelected,
                onChanged: (int ? value){
                  controller.isSelected = value!;
                  setState(() {

                  });
                }),
            Text(widget.text1!,style: TextStyle(
                color: ColorManager.secondary,fontSize: AppSize.s18,fontWeight: FontWeightManager.bold
            ),)

          ],
        ),
        Row(
          children: [
            Radio(
                activeColor: ColorManager.secondary,
                value: 1,
                groupValue: controller.isSelected,
                onChanged: (int ? value){
                  controller.isSelected = value!;
                  setState(() {

                  });
                }),
            Text(widget.text2!,style: TextStyle(
                color: ColorManager.secondary,fontSize: AppSize.s18,fontWeight: FontWeightManager.bold
            ),)

          ],
        ),
        Row(
          children: [
            Radio(
                activeColor: ColorManager.secondary,
                value: 2,
                groupValue: controller.isSelected,
                onChanged: (int ? value){
                  controller.isSelected = value!;
                  setState(() {

                  });
                }),
            Text(widget.text3!,style: TextStyle(
              color: ColorManager.secondary,fontSize: AppSize.s18,fontWeight: FontWeightManager.bold
            ),)

          ],
        ),

      ],
    );

  }
}
