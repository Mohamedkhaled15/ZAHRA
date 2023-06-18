import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../controller/item_radio_controller.dart';
import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/font_manager.dart';
import '../../../core/constant/image_assets_manager.dart';
import '../../../core/constant/strings_manger.dart';
import '../../../core/constant/values_manger.dart';
import '../../../view/widget/align_chatting.dart';
import '../../../view/widget/chating_daily_check_up.dart';
import '../../../view/widget/feel_tired_chatting.dart';
import '../../../view/widget/how_sleeping_yestrday_chatting.dart';
import '../../../view/widget/sending_msg_chatting.dart';
import '../../component/item_drawer.dart';


class ChattingDailyCheckUp extends StatefulWidget {


  const ChattingDailyCheckUp({super.key, });

  @override
  State<ChattingDailyCheckUp> createState() => _ChattingDailyCheckUpState();
}

class _ChattingDailyCheckUpState extends State<ChattingDailyCheckUp> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final controller = ItemRadioController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 10,top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: IconManager.drawer);
                    }),
                  ],
                ),
                Text(
                AppStrings.dailyCheckUp,
                style: TextStyle(
                  color: ColorManager.secondary,
                  fontSize: AppSize.s32,
                  fontWeight: FontWeightManager.bold,
                ),
                  ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorManager.secondary.withOpacity(0.2),
                  ),
                  child: Directionality(textDirection: TextDirection.rtl, child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 12,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              color: ColorManager.secondary,
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppStrings.partnerPlane,                  style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s25,
                                  fontWeight: FontWeightManager.bold,
                                ),
                                ),
                                // Image.asset(AppImageAsset.dailyCheckUp)

                              ],),
                          ),
                          const ChattingDailyCheckUpItem(),
                          const AlignChattingItems(
                            text: AppStrings.excellent,
                          ),
                          const HowSleepingYestItem(),
                          const AlignChattingItems(
                            text: AppStrings.goodSleeping,
                          ),

                          const FeelTiredChatting(),
                          SizedBox(height: MediaQuery.of(context).size.height/50,),

                          const SendMessageChatting(),
                          SizedBox(height: MediaQuery.of(context).size.height/35,),
                        ],
                      ),
                    ),
                  ),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
