import 'package:flutter/material.dart';
import 'package:zahra/presentation/component/variables.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class PayCard extends StatelessWidget {

  PayCard({required this.title,
    required this.image,
    required this.subtitle,
    required this.route});
final String title;
final String subtitle;
final String image;
final String route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(selectedName.isNotEmpty){
          Navigator.pushNamed(context, route);
        }
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppPadding.p14),

        child: Container(
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: ColorManager.darkPage,
            boxShadow: [
              BoxShadow(
                  color: ColorManager.gray, //New
                  blurRadius: 1.0,
                  offset: const Offset(1, 1),
                  spreadRadius: 1)
            ],
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              leading: Image.asset(image ,),
              title: Text(
                title,
                style:getBoldStyle(
                    color: ColorManager.darkSecondary,
                    fontSize: AppSize.s22),
              ),
              subtitle:Text(
                subtitle,
                style:getLightStyle(
                    color: ColorManager.secondary,
                    fontSize: AppSize.s18),
              ),
              trailing:  IconManager.lArrow2),


          ),

        ),
      ),
    );
  }
}
