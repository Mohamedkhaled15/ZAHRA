import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../component/item_drawer.dart';
import '../../component/item_notification.dart';
import '../../component/page_head.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'notification_controller.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  Future<void> _refresh() async {
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
 // List _savedData = [];
  bool isEmpty = true;
  NotificationController controller = NotificationController();

  Future<bool> _refresh() async {
    return Future.delayed(const Duration(seconds: 2));
    // controller.noteImages.isEmpty? isEmpty==true:isEmpty==false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _loadSavedData();
  }

  // _loadSavedData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     if (sharedPreferences.getString('key_name') != null &&
  //         sharedPreferences.getString('key_name')!.isNotEmpty) {
  //       _savedData = sharedPreferences.getKeys('key_name')!;
  //     } else {
  //       _savedData = ['list embity'];
  //     }
  //   });
  // }
  // _saveData(String message)async{
  //   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  //   sharedPreferences.setString('key_name', message);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: ColorManager.darkPage,
        child: const ItemDrawer(),
      ),
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Head(
                    title: AppStrings.notifications,
                    
                  ),
                ),
              ),
              controller.noteImages.isEmpty
                  ? Expanded(
                      flex: 5,
                      child: Container(
                        padding: const EdgeInsets.only(top: AppSize.s18),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: AppSize.s14),
                                child: Text(
                                  AppStrings.noNotifications,
                                  style: getBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s24),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Image.asset(ImageAssets.noNotification),
                            const Spacer(),
                          ],
                        ),
                      ))
                  : Expanded(
                      flex: 5,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.noteImages.length,
                        itemBuilder: (context, index) => GestureDetector(
                            onLongPressCancel: () {
                              setState(() {
                                controller.noteList.removeAt(index);
                                controller.noteImages.removeAt(index);
                                // Navigator.pop(context);
                              });
                            },
                            child: ItemNotification(controller, index)),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
