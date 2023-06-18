import 'package:flutter/material.dart';

import '../../controller/daily_check_up_controller.dart';
import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/values_manger.dart';

class CustomRowCheckUp extends StatefulWidget {
  const CustomRowCheckUp({Key? key, required this.text1, required this.text2, required this.text3}) : super(key: key);
final String text1;
final String text2;
final String text3;

  @override
  State<CustomRowCheckUp> createState() => _CustomRowCheckUpState();
}

class _CustomRowCheckUpState extends State<CustomRowCheckUp> {
  DailyCheckUpController controller = DailyCheckUpController();

  @override
  Widget build(BuildContext context) {
    return  Row(

      children: [
        Expanded(
          child: Text(
            widget.text1,
            style: TextStyle(
                color: ColorManager.secondary,
                fontSize: AppSize.s18,
                fontWeight: FontWeightManager.bold),
          ),
        ),
        // SizedBox(width:  MediaQuery.of(context).size.width/6,),

        Text(widget.text2,style: TextStyle(fontSize: AppSize.s18,color: ColorManager.secondary,
            fontWeight: FontWeightManager.bold),),
        SizedBox(width:  MediaQuery.of(context).size.width/16,),
        Expanded(child: Text(widget.text3,style: const TextStyle(fontSize: AppSize.s18,),)),


      ],
    );
  }
}
