import 'package:flutter/material.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/font_manager.dart';
import '../../core/constant/strings_manger.dart';

class RegisterByText extends StatelessWidget {
  const RegisterByText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Expanded(child: Divider(thickness: 2,color: ColorManager.black.withOpacity(0.3),)),
        SizedBox(
          width: MediaQuery.of(context).size.width /
              35,
        ),
        const Text(
          AppStrings.choiceTextInLoginScreen,
          style: TextStyle(
            fontWeight: FontWeightManager.normal,
            fontSize: 15,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width /
              35,
        ),
        Expanded(child: Divider(thickness: 2,color: ColorManager.black.withOpacity(0.3),)),

      ],
    );
  }
}
