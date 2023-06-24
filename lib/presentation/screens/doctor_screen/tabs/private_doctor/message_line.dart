import 'package:flutter/material.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';

class MessageLine extends StatelessWidget {
  MessageLine({this.text, this.sender,required this.isMe,this.senderImage});
final String? sender;
final String? text;
final String? senderImage;
final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          isMe?Material(
              borderRadius: BorderRadius.circular(25),
              color: ColorManager.darkSecondary,

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text('$text',style: getNormalStyle(color:ColorManager.white),),
              )):
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                  borderRadius: BorderRadius.circular(25),
                  color:ColorManager.white,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Text('$text',style: getNormalStyle(color:ColorManager.darkSecondary),),
                  )),
              const SizedBox(width: 15,),
              CircleAvatar(
                backgroundImage: AssetImage(senderImage!),
                ),


            ],
          ),
        ],
      ),
    );

  }
}
