import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/font_manager.dart';
import '../../../core/constant/image_assets_manager.dart';
import '../../../core/constant/strings_manger.dart';
import '../../../core/constant/values_manger.dart';
import '../../widget/circle_avatar_currant_plane.dart';
import '../../widget/container_currant_plane.dart';
import '../../widget/item_drawer.dart';
import '../log_in_screen/log_in_screen.dart';
import 'add_plan_view.dart';
import '../before_plan_screen/before_plane_view.dart';

class CurrentPlan extends StatelessWidget {
  const CurrentPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    IconButton( onPressed: (){}, icon: Icon(Icons.share,size: AppSize.s33,color: ColorManager.secondary,),),
                    const Spacer(),
                    Builder(
                        builder: (context) {
                          return GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              child: IconManager.drawer
                          );
                        }
                    ),
                  ],
                ),
              ),
              Text(AppStrings.currentPlane,style: TextStyle(
                color: ColorManager.secondary,
                fontSize: AppSize.s32 ,
                fontWeight: FontWeightManager.bold,
              ),),
              const ContainerCurrantPlaneItem(),
              SizedBox(height: MediaQuery.of(context).size.height/50,),

              Text("اضف خطة علاج جديدة",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s24),),
              const CircleAvatarCurrentPlaneItem(),
            ],
          ),
        ),
      ),
    );
  }
}
