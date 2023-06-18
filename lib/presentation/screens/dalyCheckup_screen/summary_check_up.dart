import 'package:flutter/material.dart';

import '../../../controller/daily_check_up_controller.dart';
import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/font_manager.dart';
import '../../../core/constant/image_assets_manager.dart';
import '../../../core/constant/strings_manger.dart';
import '../../../core/constant/values_manger.dart';
import '../../../view/widget/item_row_daily_checkup.dart';
import '../../component/item_drawer.dart';


class SummaryCheckUpDaily extends StatefulWidget {
  const SummaryCheckUpDaily({Key? key}) : super(key: key);

  @override
  State<SummaryCheckUpDaily> createState() => _SummaryCheckUpDailyState();
}

class _SummaryCheckUpDailyState extends State<SummaryCheckUpDaily> {
  DailyCheckUpController controller = DailyCheckUpController();

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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      size: AppSize.s33,
                      color: ColorManager.secondary,
                    ),
                  ),
                  const Spacer(),
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
                AppStrings.summaryDailyCheckUp,
                style: TextStyle(
                  color: ColorManager.secondary,
                  fontSize: AppSize.s32,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: MediaQuery.of(context).size.height / 1.3,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: ColorManager.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: ColorManager.black.withOpacity(0.3),
                  ),
                ),
                child: Directionality(textDirection: TextDirection.rtl, child: Column(
                  children: [
                    Text(
                      "الاحد 2023/1/1",
                      style: TextStyle(
                          fontSize: AppSize.s20,
                          color: ColorManager.secondary,
                          fontWeight: FontWeightManager.bold),
                    ),

                    Expanded(

                      child: ListView.builder(
                        itemBuilder: (ctc , index){

                        return CustomRowCheckUp(
                          text1: controller.dailyCheckUpListQuestion[index],
                          text2:   controller.dotting[index],
                          text3: controller.dailyCheckUpListAnswer[index],
                        );


                      },
                        itemCount: controller.dailyCheckUpListQuestion.length,
                        physics: const BouncingScrollPhysics(),
                      ),
                    ),
                  ],
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
