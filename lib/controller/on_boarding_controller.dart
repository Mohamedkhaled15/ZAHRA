import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/routes_manager.dart';
import '../data/data_sources/static_on_boarding/static.dart';


abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;

  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      Get.offAllNamed(Routes.onBoardingStartingRoute) ;
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
