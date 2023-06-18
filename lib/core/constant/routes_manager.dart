import 'package:flutter/material.dart';
import 'package:zahra/core/constant/strings_manger.dart';
import 'package:zahra/layout/shop_layout/main_layout.dart';
import '../../view/screens/add_info_screen/add_info_view.dart';
import '../../view/screens/daily_check_up_screen/daily_check_up_view.dart';
import '../../view/screens/doctor_screen/doctor_view.dart';
import '../../view/screens/home_screen/home_view.dart';
import '../../view/screens/log_in_screen/log_in_screen.dart';
import '../../view/screens/main_screen/main_view.dart';
import '../../view/screens/medicine_screen/medicine_view.dart';
import '../../view/screens/notification_screen/notification_view.dart';
import '../../view/screens/on_boarding/on_boarding_screen.dart';
import '../../view/screens/on_boarding/on_boarding_start.dart';
import '../../view/screens/profile_screen/profile_view.dart';
import '../../view/screens/register_screen/register_view.dart';
import '../../view/screens/self_exam_screen/self_examination.dart';
import '../../view/screens/splash_screen/splash_animation.dart';
import '../../view/screens/splash_screen/splash_view.dart';

class Routes {
  //main routes
  static const String splashRoute = "/splash";
  static const String mainLayout = "/mainlayout";
  static const String splashRouteTwoRoute = "/splashAnimation";
  static const String onBoardingRoute = "/onBoarding";
  static const String onBoardingStartingRoute = "/onBoardingStart";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";

  // static const String mainRoute = "/main";
  static const String doctorRoute = "/doctor";
  static const String notificationRoute = "/notification";
  static const String profileRoute = "/profile";
  static const String treatmentRoute = "/treatment";
  static const String selfExamRoute = "/selfExam";
  static const String homeRoute = "/home";
  static const String medicineRoute = "/medicine";
  static const String dalyCheckupRoute = "/dalyCheckup";
  static const String addInfoRoute = "/addInfo";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.splashRouteTwoRoute:
        return MaterialPageRoute(builder: (_) => const SplashAnimation());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.onBoardingStartingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingStart());
      case Routes.mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LogIn());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => Register());

      // case Routes.homeRoute:
      //   return MaterialPageRoute(builder: (_) =>  HomeView());
      case Routes.doctorRoute:
        return MaterialPageRoute(builder: (_) => const DoctorView());
      case Routes.medicineRoute:
        return MaterialPageRoute(builder: (_) => MedicineView());
      // case Routes.mainRoute:
      //   return MaterialPageRoute(builder: (_) =>  MainView());

      case Routes.dalyCheckupRoute:
        return MaterialPageRoute(builder: (_) => const DalyCheckupView());

      case Routes.addInfoRoute:
        return MaterialPageRoute(builder: (_) => const AddInfoView());

      case Routes.notificationRoute:
        return MaterialPageRoute(builder: (_) => const NotificationView());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case Routes.selfExamRoute:
        return MaterialPageRoute(builder: (_) => const SelfExamView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
