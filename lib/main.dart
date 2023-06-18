import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zahra/shared/constant/constant.dart';
import 'package:zahra/shared/network/local/cache_helper.dart';
import 'package:zahra/shared/network/remote/dio_helper.dart';

import 'app/app.dart';
import 'my_bloc_observe.dart';

void main() async{

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
      runApp( MyApp());
    },
    blocObserver: MyBlocObserver(),
  );



  runApp(MyApp());


}


