

import '../core/constant/image_assets_manager.dart';
import '../core/constant/routes_manager.dart';
import '../core/constant/strings_manger.dart';


class HomeController{
  var img=[
    AppImageAsset.medicineLogo,
    AppImageAsset.doctorLogo,
    AppImageAsset.groupLogo,
    AppImageAsset.medicalCheckupLogo,
    AppImageAsset.essaysIcon,
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
