import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zahra/layout/shop_layout/main_layout.dart';
import '../core/constant/app_theme.dart';
import '../core/constant/colors_manager.dart';
import '../core/constant/routes_manager.dart';
import '../layout/shop_layout/cubit/cubit.dart';
import '../layout/shop_layout/cubit/state.dart';
import '../shared/constant/constant.dart';

class MyApp extends StatefulWidget {
//named constructor
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal(); //singleton

  factory MyApp() => _instance; //factory
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopCubit>(create: (_){

      if (userToken == null) {
        return ShopCubit();
      }
      else {
        return ShopCubit()
          ..getUserData();
      }
    },
    child: BlocConsumer<ShopCubit, ShopStates>(

        listener: (ctx, state) {},
    builder: (ctx, state) {
      // ShopCubit cubit = ShopCubit.get(ctx);
      return GetMaterialApp(

        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getAppTheme(),
      );
    },
      ),
    );
    // return GetMaterialApp(
    //
    //   theme: ThemeData(scaffoldBackgroundColor:
    //   ColorManager.primary,
    //   ),
    //   debugShowCheckedModeBanner: false,
    //
    //   onGenerateRoute: RouteGenerator.getRoute,
    //   initialRoute: Routes.splashRoute,
    // );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}