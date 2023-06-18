import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/strings_manger.dart';
import '../../core/constant/values_manger.dart';

class DurationTreatmentItem extends StatefulWidget {
  const DurationTreatmentItem({Key? key}) : super(key: key);

  @override
  State<DurationTreatmentItem> createState() => _DurationTreatmentItemState();
}

class _DurationTreatmentItemState extends State<DurationTreatmentItem> {
  String? radioPattern;
  DateTime dateTime = DateTime.now();

  String? radioTreatment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          AppStrings.durationMedicine,
          style: TextStyle(
            color: ColorManager.secondary,
            fontSize: AppSize.s18,
            fontWeight: FontWeightManager.bold,
          ),
        ),
        RadioListTile(
            activeColor: ColorManager.secondary,
            title: Text(
              AppStrings.weeks,
              style: TextStyle(
                  color: ColorManager.secondary,
                  fontSize: AppSize.s20),
            ),
            value: "weeks",
            groupValue: radioTreatment,
            onChanged: (String? value) {
              setState(() {
                radioTreatment = value!;
              });
            }),
        RadioListTile(
            activeColor: ColorManager.secondary,
            title: Text(
              AppStrings.months,
              style: TextStyle(
                  color: ColorManager.secondary,
                  fontSize: AppSize.s20),
            ),
            value: "months",
            groupValue: radioTreatment,
            onChanged: (String? value) {
              setState(() {
                radioTreatment = value!;
              });
            }),
        RadioListTile(
            activeColor: ColorManager.secondary,
            title: Text(
              AppStrings.years,
              style: TextStyle(
                  color: ColorManager.secondary,
                  fontSize: AppSize.s20),
            ),
            value: "years",
            groupValue: radioTreatment,
            onChanged: (String? value) {
              setState(() {
                radioTreatment = value!;
              });
            }),
        RadioListTile(
            activeColor: ColorManager.secondary,
            title: InkWell(
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: dateTime,
                    builder: (context, child) => Theme(
                        data: ThemeData().copyWith(
                          colorScheme: ColorScheme.light(
                            primary: ColorManager.secondary,
                            onPrimary: ColorManager.white,
                            surface: ColorManager.secondary,
                          ),
                          dialogBackgroundColor:
                          ColorManager.white,
                        ),
                        child: child!),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));

                if (newDate == null) return;
                setState(() {
                  dateTime = newDate;
                });
              },
              child: Text(
                AppStrings.customizeMedicine,
                style: TextStyle(
                    color: ColorManager.secondary,
                    fontSize: AppSize.s20),
              ),
            ),
            value: "customize",
            groupValue: radioTreatment,
            onChanged: (String? value) {
              setState(() {
                radioTreatment = value!;
              });
            }),
      ],
    );
  }
}
