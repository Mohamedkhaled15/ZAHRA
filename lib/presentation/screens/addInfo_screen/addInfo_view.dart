import 'package:flutter/material.dart';
import 'package:zahra/presentation/resources/color_manager.dart';


class AddInfoView extends StatelessWidget {
  const AddInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Text("Add to  your information screen"),),
    );
  }
}

