import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class SelfExamView extends StatelessWidget {
  const SelfExamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,

      body: const Center(child: Text("Self Exam"),),
    );
  }
}
