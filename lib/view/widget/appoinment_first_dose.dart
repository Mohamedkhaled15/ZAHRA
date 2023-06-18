import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/values_manger.dart';

class AppointmentFirstDoseItem extends StatefulWidget {
  const AppointmentFirstDoseItem({Key? key}) : super(key: key);

  @override
  State<AppointmentFirstDoseItem> createState() => _AppointmentFirstDoseState();
}

class _AppointmentFirstDoseState extends State<AppointmentFirstDoseItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.only(top: 3),
          height:
          MediaQuery.of(context).size.height / 10.8,
          width:
          MediaQuery.of(context).size.width / 6.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    // clickText=!clickText;
                  });
                },
                child: Text(
                  "صباحا",
                  style: TextStyle(
                      color: ColorManager.secondary,
                      fontSize: AppSize.s16),
                ),
              ),
              Divider(
                thickness: 1,
                color: ColorManager.secondary,
              ),
              Text(
                "مساءا",
                style: TextStyle(
                    color: ColorManager.secondary,
                    fontSize: AppSize.s16),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 17),
          height:
          MediaQuery.of(context).size.height / 13.5,
          width:
          MediaQuery.of(context).size.width / 5.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "30",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppSize.s24,
                color: ColorManager.secondary),
          ),
        ),
        Center(
          child: Text(
            "-",
            style: TextStyle(
              fontSize: AppSize.s24,
              fontWeight: FontWeightManager.bold,
              color: ColorManager.secondary,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 17),
          height:
          MediaQuery.of(context).size.height / 13.5,
          width:
          MediaQuery.of(context).size.width / 5.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "06",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppSize.s24,
                color: ColorManager.secondary),
          ),
        ),
      ],
    );
  }
}
