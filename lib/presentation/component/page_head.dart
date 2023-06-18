import 'package:flutter/material.dart';
import 'package:zahra/presentation/resources/color_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class Head extends StatelessWidget {
late final String title;
Head({required this.title});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6/2,
      child: Container(

        decoration: BoxDecoration(
          color: ColorManager.primary,
          boxShadow: [
            BoxShadow(
              // color: ColorManager.primary,
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1),
              // changes position of shadow
            ),
          ],
        ),
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.only(right: AppPadding.p14),
              child: Align(
                alignment: Alignment.topRight,
                child: Builder(builder: (context) {
                  return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: IconManager.drawer);
                }),
              ),
            ),
            const Spacer(),
            Text(
            title,
              style:getBoldStyle(
                  color: ColorManager.darkSecondary,
                  fontSize: AppSize.s32),
            ),


          ],
        ),

      ),
    );
  }
}
