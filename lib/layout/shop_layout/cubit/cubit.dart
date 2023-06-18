import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zahra/layout/shop_layout/cubit/state.dart';
import 'package:zahra/view/screens/doctor_screen/doctor_view.dart';
import 'package:zahra/view/screens/main_screen/main_view.dart';

import '../../../data/model/data_model/returned_data_model.dart';
import '../../../view/screens/home_screen/home_view.dart';
import '../../../view/screens/notification_screen/notification_view.dart';
import '../../../view/screens/profile_screen/profile_view.dart';
import '../../../view/screens/setting_screen/setting_view.dart';
import '/shared/network/local/cache_helper.dart';
import '/shared/constant/constant.dart';
import '/shared/network/end_points.dart';
import '/shared/network/remote/dio_helper.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState()) {
    // getAllSavedDataSharedPreferences();
  }
  static ShopCubit get(context) => BlocProvider.of(context);


  int currentIndexBottomNavigateBar = 1;

  List<Widget> screens = [
    const NotificationView(),
     HomeView(),
    const ProfileView(),

  ];

  void changeIndexBottomNavBar(index) {
    currentIndexBottomNavigateBar = index;
    emit(ShopChangeBottomNavBarState());
  }



  int currentIndexCarouselSlider = 0;
  void changeIndexCarouselSlider(index) {
    currentIndexCarouselSlider = index;
    emit(ShopChangeIndexCarouselSliderState());
  }


  int cartQuantity = 1;
  void changeCartQuantityValue({required cartQuantity}) {
    emit(ShopChangeCartQuantityValueState());
  }


  ReturnedDataModel? userDataModel;
  String usernameValue = '';
  String emailValue = '';
  String phoneValue = '';
  void getUserData() {
    DioHelper.getData(
      url: getProfileUrl,
      token: userToken,
    ).then((value) {
      userDataModel = ReturnedDataModel.fromJson(value.data);
      usernameValue = userDataModel!.data!.name!;
      emailValue = userDataModel!.data!.email!;
      phoneValue = userDataModel!.data!.phone!;
      emit(ShopGetUserDataSuccessState());
    }).catchError((error) {
      emit(ShopGetUserDataErrorState());
    });
  }

  void changeTextFieldUserData(String newValue, String type) {
    switch (type) {
      case 'username':
        usernameValue = newValue;
        break;
      case 'email':
        emailValue = newValue;
        break;
      case 'phone':
        phoneValue = newValue;
        break;
    }
    emit(ShopChangeTextFieldUserDataState());
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopUpdateUserDataLoadingState());
    DioHelper.putData(
      url: updateProfileUrl,
      token: userToken,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userDataModel = ReturnedDataModel.fromJson(value.data);
      emit(ShopUpdateUserDataSuccessState(
          ReturnedDataModel.fromJson(value.data)));
    }).catchError((error) {
      emit(ShopUpdateUserDataErrorState());
    });
  }

  // bool isProfileContainerOpen = false;
  // void changeProfileContainerStatus() {
  //   isProfileContainerOpen = !isProfileContainerOpen;
  //   emit(ShopSettingsChangeProfileContainerStatusState());
  // }
  //
  // bool isThemeContainerOpen = false;
  // void changeThemeContainerStatus() {
  //   isThemeContainerOpen = !isThemeContainerOpen;
  //   emit(ShopSettingsChangeThemeContainerStatusState());
  // }
  //
  // bool isLanguageContainerOpen = false;
  // void changeLanguageContainerStatus() {
  //   isLanguageContainerOpen = !isLanguageContainerOpen;
  //   emit(ShopSettingsChangeLanguageContainerStatusState());
  // }

  // ThemeMode themeMode = ThemeMode.dark;
  // Color textColor = Colors.white;
  // ThemeMode themeMode = ThemeMode.light;
  // Color textColor = Colors.black;
  // void changeThemeMode(ThemeMode newThemeMode, Color newTextColor) async {
  //   themeMode = newThemeMode;
  //   textColor = newTextColor;
  //   emit(ShopChangeThemeModeState());
  //   /////////////////////
  //   await CacheHelper.saveDataInSharedPreferences(
  //     key: 'darkMode',
  //     value: themeMode == ThemeMode.dark,
  //   );
  // }
  //
  // int primaryColorIndex = 0;
  // List defaultColors = [
  //   Colors.deepOrange,
  //   Colors.teal,
  //   Colors.blue,
  //   Colors.pink,
  //   Colors.deepPurple,
  // ];
  // dynamic primaryColor = Colors.deepOrange;
  //
  // void changePrimaryColorIndex(int newIndex, dynamic color) async {
  //   primaryColorIndex = newIndex;
  //   primaryColor = color;
  //   emit(ShopChangePrimaryColorIndexState());
  //   //////////////////
  //   await CacheHelper.saveDataInSharedPreferences(
  //     key: 'primaryColor',
  //     value: primaryColorIndex,
  //   );
  // }
  //
  //
  //
  //
  // void getAllSavedDataSharedPreferences() {
  //   bool? darkModeValue =
  //   CacheHelper.getDataFromSharedPreferences(key: 'darkMode');
  //   if (darkModeValue != null) {
  //     themeMode = darkModeValue ? ThemeMode.dark : ThemeMode.light;
  //     textColor = darkModeValue ? Colors.white : Colors.black;
  //   }
  //
  //   int? pcIndex =
  //   CacheHelper.getDataFromSharedPreferences(key: 'primaryColor');
  //   primaryColorIndex = pcIndex ?? 0;
  //   primaryColor = defaultColors[primaryColorIndex];
  //
  //
  // }
}
