import 'package:flutter/material.dart';
import 'package:zahra/core/constant/colors_manager.dart';
import 'package:zahra/core/constant/strings_manger.dart';
import 'package:zahra/core/constant/values_manger.dart';

class CheckBoxSelect extends StatefulWidget {
  final text_one;
  final text_Two;

    CheckBoxSelect({super.key,  this.text_Two , this.text_one});

  @override
  _ItemAppScreen13State createState() => _ItemAppScreen13State();
}

class _ItemAppScreen13State extends State<CheckBoxSelect> {

  bool isCheckedOne = false;
  bool isCheckedTwo = false;



  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection:TextDirection.rtl,
      child: Row(
        children: [
             Text(AppStrings.selectCheckBox,style: TextStyle(
            fontSize: AppSize.s20,
            color: ColorManager.secondary,
          ),),
          SizedBox(width: MediaQuery.of(context).size.width/4.5,),
          Checkbox(side:  BorderSide(width: 1,color: ColorManager.secondary),
            checkColor: Colors.white,
            // shape: CircleBorder(side: ),
            value: isCheckedOne,
            activeColor: ColorManager.secondary,
            onChanged: (bool? value) {

              setState(() {
                isCheckedOne = value!;
              });
            },
          ),
          Text(
            widget.text_one,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
          SizedBox(width: MediaQuery.of(context).size.width/6,),

          Checkbox(side:  BorderSide(width: 1,color: ColorManager.secondary),
            checkColor: Colors.white,
            // shape: CircleBorder(side: ),
            value: isCheckedTwo,
            activeColor: ColorManager.secondary,
            onChanged: (bool? value) {

              setState(() {
                isCheckedTwo = value!;
              });
            },
          ),
          Text(
            widget.text_Two,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
      ],
    ),

    );
  }
}


