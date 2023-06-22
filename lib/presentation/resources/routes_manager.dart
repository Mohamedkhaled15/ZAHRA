import 'package:flutter/material.dart';
import 'package:zahra/presentation/resources/strings_manager.dart';
import 'package:zahra/presentation/screens/appointment_screen/appointment_view.dart';
import 'package:zahra/presentation/screens/selfExam_screen/selfExam_view.dart';
import '../../layout/shop_layout/main_layout.dart';
import '../../view/screens/add_info_screen/add_info_view.dart';
import '../../view/screens/daily_check_up_screen/daily_check_up_view.dart';
import '../../view/screens/log_in_screen/log_in_screen.dart';
import '../../view/screens/main_screen/main_view.dart';
import '../../view/screens/medicine_screen/medicine_view.dart';
import '../../view/screens/on_boarding/on_boarding_screen.dart';
import '../../view/screens/on_boarding/on_boarding_start.dart';
import '../../view/screens/register_screen/register_view.dart';
import '../../view/screens/splash_screen/splash_animation.dart';
import '../../view/screens/splash_screen/splash_view.dart';
import '../screens/doctor_screen/doctor_view.dart';
import '../screens/doctor_screen/tabs/private_doctor/private_doctor.dart';
import '../screens/doctor_screen/tabs/reversation/call_details.dart';
import '../screens/doctor_screen/tabs/reversation/continu_rev.dart';
import '../screens/doctor_screen/tabs/reversation/reservation_confirmation.dart';
import '../screens/home_screen/home_view.dart';
import '../screens/notification_screen/notification_view.dart';
import '../screens/pay/credit_pay_view.dart';
import '../screens/pay/done_view.dart';
import '../screens/pay/fawry_pay_view.dart';
import '../screens/profile_screen/profile_view.dart';
import '../screens/sign_in/sign_in_view.dart';


class Routes {
  //main routes
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String doctorRoute = "/doctor";
  static const String notificationRoute = "/notification";
  static const String profileRoute = "/profile";
  static const String treatmentRoute = "/treatment";
  static const String selfExamRoute = "/selfExam";
  static const String homeRoute = "/home";
  static const String medicineRoute = "/medicine";
  static const String dalyCheckupRoute = "/dalyCheckup";
  static const String addInfoRoute = "/addInfo";
  static const String appointment = "/appointment";
  static const String reservationConfirm = "/reservationConfirm";
  static const String continueRev = "/continueRev";
  static const String callDetails = "/callDetails";
  static const String payFawry = "/payFawry";
  static const String creditPay = "/creditPay";
  static const String done = "/done";
  static const String signIn = "/signIn";
  static const String privateDoctor = "/privateDoctor";
  static const String mainLayout = "/main_layout";
  static const String splashRouteTwoRoute= "/splashAnimation";
  static const String onBoardingRoute = "/onBoarding";
  static const String onBoardingStartingRoute = "/onBoardingStart";


}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) =>  HomeView());
      case Routes.medicineRoute:
        return MaterialPageRoute(builder: (_) =>   MedicineView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) =>    MainView());
      case Routes.mainLayout:
        return MaterialPageRoute(builder: (_) =>   const MainLayout());
      case Routes.addInfoRoute:
        return MaterialPageRoute(builder: (_) => const AddInfoView());
      case Routes.dalyCheckupRoute:
        return MaterialPageRoute(builder: (_) => const DalyCheckupView());
      case Routes.doctorRoute:
        return MaterialPageRoute(builder: (_) => const DoctorView());
      case Routes.notificationRoute:
        return MaterialPageRoute(builder: (_) =>  const NotificationView());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) =>  ProfileView());
      case Routes.selfExamRoute:
        return MaterialPageRoute(builder: (_) => const SelfExamView());
      case Routes.appointment:
        return MaterialPageRoute(builder: (_) => const Appointment());
      case Routes.reservationConfirm:
        return MaterialPageRoute(builder: (_) => const ReservationConfirm());
      case Routes.continueRev:
        return MaterialPageRoute(builder: (_) => const ContinueRev());
        case Routes.callDetails:
        return MaterialPageRoute(builder: (_) =>  CallDetails());
        case Routes.payFawry:
        return MaterialPageRoute(builder: (_) =>  PayFawry());
        case Routes.creditPay:
        return MaterialPageRoute(builder: (_) =>  CreditPay());
        case Routes.done:
        return MaterialPageRoute(builder: (_) =>  const Done());
        case Routes.signIn:
        return MaterialPageRoute(builder: (_) =>  const SignIn());
        case Routes.privateDoctor:
        return MaterialPageRoute(builder: (_) =>  const PrivateDoctor());
        case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) =>  const SplashView());
      case Routes.splashRouteTwoRoute:
        return MaterialPageRoute(builder: (_) => const SplashAnimation());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.onBoardingStartingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingStart());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LogIn());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => Register());

    // case Routes.homeRoute:
    //   return MaterialPageRoute(builder: (_) =>  HomeView());
    // case Routes.mainRoute:
    //   return MaterialPageRoute(builder: (_) =>  MainView());








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


