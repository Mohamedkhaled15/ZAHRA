import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/values_manger.dart';

class ItemContentDailyCheckUp extends StatefulWidget {

  final Function()?onPressed;


   ItemContentDailyCheckUp({Key? key , this.onPressed,}) : super(key: key);

  @override
  State<ItemContentDailyCheckUp> createState() => _ItemContentDailyCheckUpState();
}

class _ItemContentDailyCheckUpState extends State<ItemContentDailyCheckUp> {

  bool  shouldShowContainer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height/3.8,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(30),
          color: ColorManager.secondary.withOpacity(0.1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(

            children: [
              IconButton(onPressed: widget.onPressed, icon: Icon(Icons.share,color: ColorManager.secondary,),),
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
              Text("Aldesleukin",style: TextStyle(color: ColorManager.black,fontSize: AppSize.s14)),
              SizedBox(width: MediaQuery.of(context).size.width/9,),
              Text(":",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18)),
              SizedBox(width: MediaQuery.of(context).size.width/11),

              Text("اسم الدواء",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18),),

            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("3 جرعات",style: TextStyle(color: ColorManager.black,fontSize: AppSize.s14)),
              SizedBox(width: MediaQuery.of(context).size.width/9,),
              Text(":",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18)),
              SizedBox(width: MediaQuery.of(context).size.width/20),

              Text("عدد الجرعات",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18),),

            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: widget.onPressed, icon: Icon(Icons.delete,color: ColorManager.secondary,)),
              SizedBox(width: MediaQuery.of(context).size.width/4,),

              Text("شهري",style: TextStyle(color: ColorManager.black,fontSize: AppSize.s14)),
              SizedBox(width: MediaQuery.of(context).size.width/9,),
              Text(":",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18)),
              SizedBox(width: MediaQuery.of(context).size.width/20),

              Text("نمط الجرعات",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18),),

            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("من 11 فبراير الي 11 ابريل",style: TextStyle(color: ColorManager.black,fontSize: AppSize.s14)),
              SizedBox(width: MediaQuery.of(context).size.width/9,),
              Text(":",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18)),
              SizedBox(width: MediaQuery.of(context).size.width/20),

              Text("الفترة الزمنية",style: TextStyle(color: ColorManager.secondary,fontSize: AppSize.s18),),

            ],
          ),

        ],
      ),
    );
  }
}
