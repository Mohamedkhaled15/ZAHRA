import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:zahra/presentation/component/doctor_card.dart';
import 'package:zahra/presentation/resources/assets_manager.dart';
import 'package:zahra/presentation/resources/strings_manager.dart';
import 'package:zahra/presentation/resources/values_manager.dart';


import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';

class SearchForDoctorView extends StatefulWidget {
  const SearchForDoctorView({Key? key}) : super(key: key);

  @override
  State<SearchForDoctorView> createState() => _SearchForDoctorViewState();
}

class _SearchForDoctorViewState extends State<SearchForDoctorView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:  const EdgeInsets.symmetric(
              horizontal: AppMargin.m4, vertical: AppMargin.m4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  color: ColorManager.gray, //New
                  blurRadius: 1.0,
                  offset: Offset(1, 1),
                  spreadRadius: 1)
            ],
          ),
          child: TextFormField(
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: ColorManager.lightSecondary,
                fontSize: FontSize.s22,
                fontFamily: 'Poppins'),
            cursorColor: ColorManager.secondary,
            decoration: InputDecoration(
                hintTextDirection: TextDirection.rtl,
                labelStyle: TextStyle(color: ColorManager.lightSecondary),
                fillColor: ColorManager.darkPage,
                hintText: AppStrings.docHint,
                filled: true,
                prefixIcon: InkWell(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width / 7,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: ColorManager.gray, //New
                                  blurRadius: 1.0,
                                  offset: const Offset(0, 1),
                                  spreadRadius: 1)
                            ],
                            color: ColorManager.darkSecondary,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25))),
                        child: IconManager.search))),
          ),
        ),
        //item doc------------------------------
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: false,
            children: const [

            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            ],

          ),
        ),
      ],
    );
  }
}
