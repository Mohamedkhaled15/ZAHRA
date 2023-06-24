import 'package:flutter/material.dart';
import 'package:zahra/presentation/component/item_drawer.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'blogs_controller.dart';

class AddInfoView extends StatelessWidget {
  BlogsController controller = BlogsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      endDrawer: Drawer(
        backgroundColor: ColorManager.darkPage,
        child: const ItemDrawer(),
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(right: AppSize.s14),
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
                Text(
                  AppStrings.addInfo,
                  style: getBoldStyle(
                      color: ColorManager.darkSecondary, fontSize: AppSize.s33),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => Column(

                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14,vertical: AppPadding.p14,),
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppMargin.m10, vertical: AppMargin.m10),
                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.darkPage,
                        boxShadow: [
                          BoxShadow(
                              color: ColorManager.gray, //New
                              blurRadius: 1.0,
                              offset: Offset(1, 1),
                              spreadRadius: 1)
                        ],
                      ),
                      child: Column(

                        children: [
                          Text(controller.labels[index],style: getBoldStyle(color: ColorManager.darkSecondary),),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Image.asset("assets/images/b1.jpg",),
                          // ),
                          Center(child: Text(
                            controller.data[index],
                            style: getNormalStyle(color: ColorManager.black),
                          textAlign: TextAlign.start,
                            textDirection: TextDirection.rtl,
                          )),

                        ],
                      ),
                    ),
                  ],
                )),
          )
        ]),
      ),
    );
  }
}
