import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/values_manger.dart';
import '../screens/add_plane_screen/add_plan_view.dart';
import '../screens/before_plan_screen/before_plane_view.dart';

class ContainerCurrantPlaneItem extends StatefulWidget {
  const ContainerCurrantPlaneItem({Key? key}) : super(key: key);

  @override
  State<ContainerCurrantPlaneItem> createState() => _ContainerCurrantPlaneItemState();
}

class _ContainerCurrantPlaneItemState extends State<ContainerCurrantPlaneItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 37),
          margin: const EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height/4.5,
          width: MediaQuery.of(context).size.width/1.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: ColorManager.black.withOpacity(0.3),

            ),
            color: ColorManager.secondary.withOpacity(0.2),
          ),
          child: Column(
            children: [
              Row(

                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.share,color: ColorManager.secondary,),),
                  SizedBox(width: MediaQuery.of(context).size.width/5.5,),

                  Align(
                    alignment: Alignment.center,
                    child: Text("خطة العلاج الشهرية",style: TextStyle(
                      color: ColorManager.secondary,
                      fontSize: AppSize.s18,
                    ),),
                  ),
                ],),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Aldeslkiu",),
                  SizedBox(width: MediaQuery.of(context).size.width/10,),

                  Text(": اسم الدواء",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s16),),

                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("من 18 فبراير الي 18 فبراير",),
                  SizedBox(width: MediaQuery.of(context).size.width/14,),

                  Text(": الفترة الزمنية",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s16),),

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: ColorManager.secondary,size: AppSize.s33
                    ,),),
                  SizedBox(width: MediaQuery.of(context).size.width/18,),
                  Container(
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: ColorManager.secondary,
                    ),
                    child: TextButton(onPressed: (){
                      Get.to(() =>  AddPlaneView(),
                      );


                    },child: Text("تعديل",style: TextStyle(color: ColorManager.white,
                        fontSize: AppSize.s18
                    ),


                    ),),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/17,),
                  Container(
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: ColorManager.secondary,
                    ),
                    child: TextButton(onPressed: (){
                      Get.to(() =>  BeforePlaneView(),
                      );

                    },child: Text("ارشفة",style: TextStyle(color: ColorManager.white,
                        fontSize: AppSize.s18
                    ),


                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 37),
          margin: const EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height/2.9,
          width: MediaQuery.of(context).size.width/1.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: ColorManager.black.withOpacity(0.3),

            ),
            color: ColorManager.secondary.withOpacity(0.2),
          ),
          child: Column(
            children: [
              Row(

                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.share,color: ColorManager.secondary,),),
                  SizedBox(width: MediaQuery.of(context).size.width/5.5,),

                  Align(
                    alignment: Alignment.center,
                    child: Text("خطة العلاج الاسبوعية",style: TextStyle(
                      color: ColorManager.secondary,
                      fontSize: AppSize.s18,
                    ),),
                  ),
                ],),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Aldeslkiu",),
                  SizedBox(width: MediaQuery.of(context).size.width/10,),

                  Text(": اسم الدواء",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s16),),

                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("من 18 فبراير الي 18 فبراير",),
                  SizedBox(width: MediaQuery.of(context).size.width/14,),

                  Text(": الفترة الزمنية",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s16),),

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),

              Divider(color: ColorManager.secondary,indent: 60,),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Aldeslkiu",),
                  SizedBox(width: MediaQuery.of(context).size.width/10,),

                  Text(": اسم الدواء",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s16),),

                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("من 18 فبراير الي 18 فبراير",),
                  SizedBox(width: MediaQuery.of(context).size.width/14,),

                  Text(": الفترة الزمنية",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s16),),

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),

              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: ColorManager.secondary,size: AppSize.s33
                    ,),),
                  SizedBox(width: MediaQuery.of(context).size.width/18,),
                  Container(
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: ColorManager.secondary,
                    ),
                    child: TextButton(onPressed: (){
                      Get.to(() =>  AddPlaneView(),
                      );
                    },child: Text("تعديل",style: TextStyle(color: ColorManager.white,
                        fontSize: AppSize.s18
                    ),


                    ),),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/17,),
                  Container(
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: ColorManager.secondary,
                    ),
                    child: TextButton(onPressed: (){
                      Get.to(() =>  BeforePlaneView(),
                      );
                    },child: Text("ارشفة",style: TextStyle(color: ColorManager.white,
                        fontSize: AppSize.s18
                    ),


                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
