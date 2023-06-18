

import '../../resources/assets_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';

class HomeController{
  var img=[
    ImageAssets.medicineLogo,
    ImageAssets.doctorLogo,
    ImageAssets.groupLogo,
    ImageAssets.medicalCheckupLogo,
    ImageAssets.essaysIcon,
    ];
  var listImg=[
    "assets/images/doctor.png",
    "assets/images/.png",
    "assets/images/.png",
    "assets/images/.png",
  ];

  var label=[
    AppStrings.medicine,
    AppStrings.doctor,
    AppStrings.self,
    AppStrings.checkup,
    AppStrings.essays,

  ];

  var nav=[
    Routes.medicineRoute,
    Routes.doctorRoute,
    Routes.selfExamRoute,
    Routes.dalyCheckupRoute,
    Routes.addInfoRoute,


  ];



}