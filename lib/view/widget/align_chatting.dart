import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/strings_manger.dart';
import '../../core/constant/values_manger.dart';

class AlignChattingItems extends StatefulWidget {
  const AlignChattingItems({Key? key, this.text}) : super(key: key);
  final text;

  @override
  State<AlignChattingItems> createState() => _AlignChattingItemsState();
}

class _AlignChattingItemsState extends State<AlignChattingItems> {
  @override
  Widget build(BuildContext context) {
    return  Align(alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(right: 13,top: 2,),
        margin: const EdgeInsets.only(left: 10),
        height: MediaQuery.of(context).size.height/24,
        width: MediaQuery.of(context).size.width/4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorManager.secondary,
        ),child: Text(widget.text,style: TextStyle(color: ColorManager.white,fontSize: AppSize.s18),),
      ),
    );
  }
}
