

import '../core/constant/image_assets_manager.dart';
import '../core/constant/strings_manger.dart';

class NotificationController {




  void refrech(){

  }

  var noteList=[
    AppStrings.notificationHint1,
    AppStrings.notificationHint1,
    AppStrings.notificationHint1,
    AppStrings.notificationHint2,
    AppStrings.notificationHint3,
    AppStrings.notificationHint4,
    AppStrings.notificationHint5,
    AppStrings.notificationHint6,

  ];

  var noteImages=[
    AppImageAsset.medicine2,
    AppImageAsset.medicine2,
    AppImageAsset.medicine2,
    AppImageAsset.doctorLogo2,
    AppImageAsset.medicalCheckupLogo2,
    AppImageAsset.article,
    AppImageAsset.newI,
    AppImageAsset.searching,

  ];


  void toggleView() {
    if (noteList.isEmpty) {
      return ;
    }else{
      return print("list is fill");
    }
  }
  void remove(){

//noteImages.remove();

  }
}
