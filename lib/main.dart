import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zahra/presentation/resources/theme_manager.dart';

import 'package:zahra/shared/constant/constant.dart';
import 'package:zahra/shared/network/local/cache_helper.dart';
import 'package:zahra/shared/network/remote/dio_helper.dart';

import 'app/app.dart';
import 'my_bloc_observe.dart';

void main() async {
  getAppTheme();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  DioHelper.init();
  await CacheHelper.init();
  userToken = CacheHelper.getDataFromSharedPreferences(key: 'userToken');
  debugPrint('Token --> $userToken');
  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

  runApp(MyApp());

}
final dio = Dio();

void getHttp() async {
  final response = await dio.get('https://zahra2023.000webhostapp.com/api/doctors');
  var resp= response.data;
  print(resp["data"][1]["doctor_description"]);
}
