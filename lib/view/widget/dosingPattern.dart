import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/strings_manger.dart';
import '../../core/constant/values_manger.dart';

class DosingPatternItem extends StatefulWidget {
  const DosingPatternItem({Key? key}) : super(key: key);

  @override
  State<DosingPatternItem> createState() => _DosingPatternItemState();
}

class _DosingPatternItemState extends State<DosingPatternItem> {
  String? radioPattern;

  String? radioTreatment;

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.dosingPattern,
          style: TextStyle(
            fontSize: AppSize.s22,
            color: ColorManager.secondary,
            fontWeight: FontWeightManager.bold,
          ),
        ),
        RadioListTile(
            activeColor: ColorManager.secondary,
            title: Text(
              AppStrings.dayMedicine,
              style: TextStyle(
                  color: ColorManager.secondary,
                  fontSize: AppSize.s20),
            ),
            value: "day",
            groupValue: radioPattern,
            onChanged: (String? value) {
              setState(() {
                radioPattern = value!;
              });
            }),
        RadioListTile(
            activeColor: ColorManager.secondary,
            title: Text(
              AppStrings.weekMedicine,
              style: TextStyle(
                  color: ColorManager.secondary,
                  fontSize: AppSize.s20),
            ),
            value: "week",
            groupValue: radioPattern,
            onChanged: (String? value) {
              setState(() {
                radioPattern = value!;
              });
            }),
        RadioListTile(
            activeColor: ColorManager.secondary,
            title: Text(
              AppStrings.monthMedicine,
              style: TextStyle(
                  color: ColorManager.secondary,
                  fontSize: AppSize.s20),
            ),
            value: "month",
            groupValue: radioPattern,
            onChanged: (String? value) {
              setState(() {
                radioPattern = value!;
              });
            }),
      ],
    );
  }
}
