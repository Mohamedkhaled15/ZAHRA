import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/values_manger.dart';

class SendMessageChatting extends StatefulWidget {
  const SendMessageChatting({Key? key}) : super(key: key);

  @override
  State<SendMessageChatting> createState() => _SendMessageChattingState();
}

class _SendMessageChattingState extends State<SendMessageChatting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: ColorManager.secondary,
            style: TextStyle(color: ColorManager.white),
            scrollPadding: const EdgeInsets.all(10),
            cursorWidth: 2.5,

            decoration: InputDecoration(
              hintText: "اكتب رسالة...",
              isDense: true,
              suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.send,size: AppSize.s24,color: ColorManager.white,)),
              hintStyle: TextStyle(color: ColorManager.black.withOpacity(0.5)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.secondary),

                borderRadius: const BorderRadius.all(Radius.circular(25),

                ),

              ),
              fillColor: ColorManager.secondary,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                borderSide: BorderSide(color: ColorManager.secondary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color:  ColorManager.secondary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
