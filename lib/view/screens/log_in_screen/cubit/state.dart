
import '../../../../data/model/data_model/returned_data_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  final ReturnedDataModel userDataModel;

  ShopLoginSuccessState(this.userDataModel);
}

class ShopLoginErrorState extends ShopLoginStates {
  final String error;
  ShopLoginErrorState(this.error);
}

class ShopLoginChangePasswordVisibilityState extends ShopLoginStates {}
