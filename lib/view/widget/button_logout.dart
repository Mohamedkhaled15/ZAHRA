import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zahra/core/constant/colors_manager.dart';
import 'package:zahra/core/constant/values_manger.dart';


import '../../layout/shop_layout/cubit/cubit.dart';
import '../../layout/shop_layout/cubit/state.dart';
import '../../shared/constant/constant.dart';

class ButtonLogoutItem extends StatelessWidget {
  const ButtonLogoutItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (ctx, state) {

      },

      builder: (ctx, state) {

        return Center(
          child: TextButton(
              onPressed: (){
                showDialog(context: context, builder:  (BuildContext context){
                  return AlertDialog(
                    content: Text("تسجيل الخروج",style: TextStyle(
                      color: ColorManager.secondary,
                      fontSize: AppSize.s24,
                    ),),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: (const Text("No")),),
                      TextButton(onPressed: (){
                        userLogout(ctx);
                      }, child: (const Text("Yes")),),
                    ],
                  );
                },);

          },
              child: Text("تسجيل الخروج",style: TextStyle(
                color: ColorManager.secondary,
                fontSize: AppSize.s24,
              ))),
        );
      },
    );
  }

}
