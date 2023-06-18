import 'package:flutter/material.dart';
import 'package:zahra/presentation/screens/home_screen/home_controller.dart';

import '../../component/item_drawer.dart';
import '../../component/item_home.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class HomeView extends StatelessWidget {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),
        ),
        backgroundColor: ColorManager.primary,
        body: Container(
          padding: const EdgeInsets.only(right: AppSize.s14),
          child: Column(


              children: [
            Align(
              alignment: Alignment.topRight,
              child: Builder(builder: (context) {
                return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: IconManager.drawer);
              }),
            ),
            const SizedBox(height: AppSize.s5),
            Container(
              margin: const EdgeInsets.only(bottom: AppMargin.m14),
              padding:
                  const EdgeInsets.only(right: AppSize.s14, top: AppSize.s4),
              height: AppSize.s102,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s25),
                color: ColorManager.darkPage,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width:
                          MediaQuery.of(context).size.width / 3 + AppSize.s14,
                      height: AppSize.s36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s25),
                        color: ColorManager.orange,
                      ),
                      child: Center(
                        child: Text(AppStrings.alarmCome,
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s26)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text.rich(
                        const TextSpan(children: <TextSpan>[
                          TextSpan(text: "${AppStrings.alarmHint}\n"),
                          TextSpan(text: AppStrings.alarmHint2)
                        ]),
                        textAlign: TextAlign.right,
                        style: getNormalStyle(
                            color: ColorManager.black, fontSize: FontSize.s18)),
                  ),
                ],
              ),
            ),
            Expanded(

              child: Container(
                  padding: const EdgeInsets.only(bottom: AppPadding.p14),
                  width: double.infinity,
                  height: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: AppSize.s14,
                        right: AppSize.s14,
                        left: AppSize.s14),
                    decoration: BoxDecoration(
                      color: ColorManager.darkPage,
                      borderRadius: BorderRadius.circular(AppSize.s25),
                    ),
                    child: Center(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.img.length,
                        itemBuilder: (context, index) =>
                            ItemHome(controller, index),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: AppCount.n2,
                          crossAxisSpacing: AppSize.s14,
                          mainAxisSpacing: AppSize.s14,
                          mainAxisExtent: 174,
                        ),
                      ),
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
