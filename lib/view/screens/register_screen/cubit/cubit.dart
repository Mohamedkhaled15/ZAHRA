import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zahra/view/screens/register_screen/cubit/state.dart';

import '../../../../data/model/data_model/returned_data_model.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());
  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  bool isButtonRegisterClicked = false;
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    isButtonRegisterClicked = true;
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: registerUrl,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      emit(ShopRegisterSuccessState(ReturnedDataModel.fromJson(value.data)));
    }).catchError((error) {
      emit(ShopRegisterErrorState(error.toString()));
    });
  }


  bool isPasswordObscure = false;
  IconData icon = Icons.visibility;
  void changePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    icon = isPasswordObscure ? Icons.visibility_off : Icons.visibility;
    emit(ShopRegisterChangePasswordVisibilityState());
  }
}
