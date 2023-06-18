import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/image_assets_manager.dart';
import '../../core/constant/strings_manger.dart';
import '../../core/constant/values_manger.dart';

class ItemDropDownMenu extends StatefulWidget {
  const ItemDropDownMenu({Key? key, this.text}) : super(key: key);
  final text;

  @override
  State<ItemDropDownMenu> createState() => _ItemDropDownMenuState();
}

class _ItemDropDownMenuState extends State<ItemDropDownMenu> {
  var selectedYears = "2023";
  var selectedMonths = "يناير";
  var selectedPlane = "شهري";

  List<String> itemsYears = [
    "2023",
    "2022",
    "2021",
    "2020",
  ];
  List<String> itemsMonths = [
    "يناير",
    "فبراير",
    "مارس",
    "ابريل",
  ];
  List<String> itemsPlane = [
    "شهري",
    "يومي",
    "اسبوعي",
    "تخصيص",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(

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
          widget.text,
          style: TextStyle(
            color: ColorManager.secondary,
            fontSize: AppSize.s25,
            fontWeight: FontWeightManager.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 13.8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorManager.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 26,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: ColorManager.secondary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // DropdownButton(
                        //   items: itemsYears.map((course) {
                        //     return DropdownMenuItem(
                        //       value: course,
                        //       child: Text(course),
                        //     );
                        //   }).toList(),
                        //   dropdownColor: ColorManager.primary,
                        //   underline: const SizedBox(),
                        //   icon: Icon(
                        //     Icons.arrow_drop_down,
                        //     size: 40,
                        //     color: ColorManager.white,
                        //   ),
                        //   onChanged: (val) {
                        //     setState(() {
                        //       selectedYears = val as String;
                        //     });
                        //   },
                        //   // value: selectedYears,
                        // ),

                        // DropdownButton<String>(
                        //   iconDisabledColor: ColorManager.white,
                        //   iconEnabledColor: ColorManager.white,
                        //
                        //   items: itemList.map((item) => DropdownMenuItem(
                        //     value: item,
                        //     child: Text(item),
                        //   )).toList(),
                        //   onChanged:(item) => setState(() => selectItem = item),
                        //   value: selectItem,),
                         Icon(Icons.arrow_drop_down,color: ColorManager.white,size: AppSize.s32,),
                        SizedBox(width: MediaQuery.of(context).size.width/50,),
                        Text(
                          "السنة",
                          style: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWeightManager.bold),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 130,
                  ),
                  Text(
                    selectedYears,
                    style: TextStyle(
                      color: ColorManager.secondary,
                      fontWeight: FontWeightManager.bold,
                      fontSize: AppSize.s16,
                    ),
                  ),
                  // Text("2023",style: TextStyle(color: ColorManager.secondary,fontWeight: FontWeightManager.bold,
                  //   fontSize: AppSize.s16,
                  // ),),
                ],
              ),
              Expanded(
                  child: VerticalDivider(
                color: ColorManager.white,
                thickness: 1,
              )),
              // VerticalDivider(color: ColorManager.white,thickness: 1.5,),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 1),
                    height: MediaQuery.of(context).size.height / 26,
                    width: MediaQuery.of(context).size.width / 3.2,
                    decoration: BoxDecoration(
                      color: ColorManager.secondary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Expanded(
                        //   child: DropdownButton(
                        //     items: itemsMonths.map((course) {
                        //       return DropdownMenuItem(
                        //         value: course,
                        //         child: Text(course),
                        //       );
                        //     }).toList(),
                        //     elevation: 0,
                        //
                        //     dropdownColor: ColorManager.primary,
                        //     underline: const SizedBox(),
                        //     icon: Icon(
                        //       Icons.arrow_drop_down,
                        //       size: 40,
                        //       color: ColorManager.white,
                        //     ),
                        //     onChanged: (val) {
                        //       setState(() {
                        //         selectedMonths = val as String;
                        //       });
                        //     },
                        //     // value: selectedMonths,
                        //   ),
                        // ),
                        Icon(Icons.arrow_drop_down,color: ColorManager.white,size: AppSize.s32,),
                        SizedBox(width: MediaQuery.of(context).size.width/50,),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "الشهر",
                            style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeightManager.bold),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    selectedMonths,
                    style: TextStyle(
                        color: ColorManager.secondary,
                        fontWeight: FontWeightManager.bold,
                        fontSize: AppSize.s16),
                  ),
                ],
              ),
              // VerticalDivider(color: ColorManager.white,thickness: 1.5,),
              // Container(height: 5,color: ColorManager.white,width: 1,),
              Expanded(
                  child: VerticalDivider(
                color: ColorManager.white,
                thickness: 1,
              )),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 3, top: 1),
                    height: MediaQuery.of(context).size.height / 26,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      color: ColorManager.secondary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // DropdownButton(
                        //   items: itemsPlane.map((course){
                        //
                        //     return DropdownMenuItem(value: course,child: Text(course),);
                        //   }
                        //   ).toList(),
                        //   dropdownColor: ColorManager.primary,
                        //   underline:const SizedBox() ,
                        //   icon: Icon(Icons.arrow_drop_down,size: 40,color:ColorManager.white,),
                        //   onChanged: (val){
                        //     setState(() {
                        //       selectedPlane= val as String;
                        //     });
                        //   },
                        //   // value: selectedPlane,
                        // ),

                        Text(
                          "نوع الخطة",
                          style: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWeightManager.bold),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "شهري",
                    style: TextStyle(
                        color: ColorManager.secondary,
                        fontWeight: FontWeightManager.bold,
                        fontSize: AppSize.s16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
