import 'package:flutter/material.dart';

import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/image_assets_manager.dart';
import '../../../presentation/screens/home_screen/home_view.dart';
import '../../../presentation/screens/notification_screen/notification_view.dart';
import '../../../presentation/screens/profile_screen/profile_view.dart';




class MainView extends StatefulWidget {


  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex=1;
  List<Widget> screens=[
    const NotificationView(),
    HomeView(),
    const ProfileView(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      backgroundColor: ColorManager.primary,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(()
          {
            currentIndex=index;

          });
        },

        backgroundColor: ColorManager.darkPage,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(icon:currentIndex==0? IconManager.bellFill:IconManager.bell,label: ''),
          BottomNavigationBarItem(icon:currentIndex==1? IconManager.homeFill:IconManager.home,label: ''),
          BottomNavigationBarItem(icon:currentIndex==2? IconManager.personFill:IconManager.person,label: ''),
        ],
      ),

    );
  }
}
