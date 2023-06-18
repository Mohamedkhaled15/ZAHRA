import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';

class ContinueButton extends StatelessWidget {
  late final String? text;
  late final String? routes;

  ContinueButton({this.text,this.routes});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width/2,
        height:65 ,
        decoration: BoxDecoration(
          color: ColorManager.darkSecondary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextButton(
          onPressed: (){
            Navigator.pushNamed(context, routes!);
          },
          child: Text(text!,style: getNormalStyle(color: ColorManager.white),),
        ),

      ),
    );
  }
}
