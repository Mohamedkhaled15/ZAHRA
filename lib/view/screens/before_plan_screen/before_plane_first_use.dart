import 'package:flutter/material.dart';

import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/font_manager.dart';
import '../../../core/constant/image_assets_manager.dart';
import '../../../core/constant/strings_manger.dart';
import '../../../core/constant/values_manger.dart';
import '../../widget/item_drawer.dart';
import '../../widget/item_drop_down_menu.dart';

class BeforePlaneFirstUse extends StatelessWidget {
  const BeforePlaneFirstUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        backgroundColor: ColorManager.primary,
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),
        ),
        body: Padding(padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
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
              const ItemDropDownMenu(),
              SizedBox(height: MediaQuery.of(context).size.height/2.1,),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(top: 5.6),
                  margin: const EdgeInsets.only(left: 15),
                  width: MediaQuery.of(context).size.width/6.7,
                  height: MediaQuery.of(context).size.height/22,
                  decoration: BoxDecoration(
                    color: ColorManager.secondary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(onPressed: (){}, child: Text("عودة",
                    style: TextStyle(
                        color: ColorManager.white,
                        height: 0.2,
                        fontSize: AppSize.s16,
                        fontWeight: FontWeightManager.bold
                    ),)),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
