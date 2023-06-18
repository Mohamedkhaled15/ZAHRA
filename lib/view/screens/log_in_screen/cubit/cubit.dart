import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zahra/view/screens/log_in_screen/cubit/state.dart';

import '../../../../data/model/data_model/returned_data_model.dart';
import '/shared/network/end_points.dart';
import '/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);

  bool isButtonLoginClicked = false;
  void userLogin({
    required String email,
    required String password,
  }) {
    isButtonLoginClicked = true;
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: loginUrl,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      emit(ShopLoginSuccessState(ReturnedDataModel.fromJson(value.data)));
    }).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
    });
  }


  bool isPasswordObscure = false;
  IconData icon = Icons.visibility;
  void changePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    icon = isPasswordObscure ? Icons.visibility_off : Icons.visibility;
    emit(ShopLoginChangePasswordVisibilityState());
  }
}
