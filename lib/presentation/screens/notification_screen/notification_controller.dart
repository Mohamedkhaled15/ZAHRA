import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

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
    ImageAssets.medicine2,
    ImageAssets.medicine2,
    ImageAssets.medicine2,
    ImageAssets.doctorLogo2,
    ImageAssets.medicalCheckupLogo2,
    ImageAssets.article,
    ImageAssets.newI,
    ImageAssets.searching,

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