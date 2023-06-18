import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/image_assets_manager.dart';
import '/shared/constant/constant.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';


class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        var cubit = ShopCubit.get(ctx);
        return Scaffold(

          body: cubit.screens[cubit.currentIndexBottomNavigateBar],

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorManager.primary,
            currentIndex: cubit.currentIndexBottomNavigateBar,
            items:   [
              BottomNavigationBarItem(
                icon: cubit.currentIndexBottomNavigateBar==0?IconManager.bellFill:IconManager.bell,
                label: "",

              ),
              BottomNavigationBarItem(
                icon: cubit.currentIndexBottomNavigateBar==1? IconManager.homeFill:IconManager.home,
                label: "",

              ),
              BottomNavigationBarItem(
                icon: cubit.currentIndexBottomNavigateBar==2? IconManager.personFill:IconManager.person,
                label: "",

              ),
              // const BottomNavigationBarItem(
              //   icon: Icon(Icons.settings),
              //   label: "",
              //
              // ),
            ],
            onTap: (index) => cubit.changeIndexBottomNavBar(index),
          ),
        );
      },
    );
  }
}
