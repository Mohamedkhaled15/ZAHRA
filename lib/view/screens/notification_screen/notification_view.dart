import 'package:flutter/material.dart';


import '../../../controller/notification_controller.dart';
import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/font_manager.dart';
import '../../../core/constant/image_assets_manager.dart';
import '../../../core/constant/strings_manger.dart';
import '../../../core/constant/styles_manger.dart';
import '../../../core/constant/values_manger.dart';
import '../../widget/item_drawer.dart';
import '../../widget/item_notification.dart';

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
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),
        ),
        backgroundColor: ColorManager.primary,
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(right: AppSize.s14),
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    boxShadow: [
                      BoxShadow(
                        // color: ColorManager.primary,
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 1),
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Builder(builder: (context) {
                          return GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              child: IconManager.drawer);
                        }),
                      ),
                      Expanded(
                        child: Text(
                          AppStrings.notifications,
                          style: getBoldStyle(
                              color: ColorManager.darkSecondary,
                              fontSize: AppSize.s41),
                        ),
                      )
                    ],
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
                        Image.asset(AppImageAsset.noNotification),
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
