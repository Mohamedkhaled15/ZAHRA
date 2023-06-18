import 'package:flutter/material.dart';
import 'package:zahra/core/constant/strings_manger.dart';

import '../../../controller/container_remove.dart';
import '../../../core/constant/colors_manager.dart';

import '../../widget/item_back_navigate.dart';
import '../../widget/item_content_daily_check_up.dart';
import '../../widget/item_drawer.dart';
import '../../widget/item_drop_down_menu.dart';

class BeforePlaneView extends StatefulWidget {
   BeforePlaneView({Key? key,}) : super(key: key);
   @override
  State<BeforePlaneView> createState() => _BeforePlaneViewState();
}

class _BeforePlaneViewState extends State<BeforePlaneView> {
  List<String> itemList = ["شهري" ,"سنة" ,"اسبوعي"];

String? selectItem = "";
  bool  shouldShowContainer = false;


  // final controller =ContainerRemove();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
          child: Column(
            children: [

              const ItemDropDownMenu(text: AppStrings.beforePlane,),
              Expanded(
                child: ListView.builder(
                    physics:const BouncingScrollPhysics(),
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (ctc ,index){
                      return ItemContentDailyCheckUp(onPressed: (){
                        setState(() {
                          // controller.values[index];
                          // shouldShowContainer = !shouldShowContainer;
                        });
                      });

                    }),
              ),
              // Expanded(
              //   child: Visibility(
              //
              //     visible:controller.values[index] ,
              //
              //     child: ListView.builder(
              //       physics:const BouncingScrollPhysics(),
              //         itemCount: 4,
              //         shrinkWrap: true,
              //         itemBuilder: (ctc ,index){
              //       return ItemContentDailyCheckUp(onPressed: (){
              //         setState(() {
              //           controller.values[index];
              //           // shouldShowContainer = !shouldShowContainer;
              //         });
              //       });
              //
              //     }),
              //   ),
              // ),
              SizedBox(height: MediaQuery.of(context).size.height/20,),

              ItemBackNavigate(
                onPressed: (){
                // هيروح ل اسكرينة الدكتور
                },
              ),
              // TextButton(onPressed: (){
              //   setState(() {
              //     shouldShowContainer = !shouldShowContainer;
              //   });
              // }, child: Text("Show")),
            ],
          ),
        ),
      ),
    );
  }
}
