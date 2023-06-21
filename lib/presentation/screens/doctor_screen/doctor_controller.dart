import 'package:zahra/presentation/resources/assets_manager.dart';
import 'package:zahra/presentation/resources/strings_manager.dart';

import '../../../app/app.dart';
import '../../../main.dart';



class DoctorController{
  String? docName;

  void getHttp() async {
    final response = await dio.get('https://zahra2023.000webhostapp.com/api/doctors');
    docName= response.data[0]["doctor_name"];
    print(docName);
  }



 var listName=[
   AppStrings.docName,
   AppStrings.docName,
   AppStrings.docName,
 ];
 var listImage=[
   ImageAssets.me,
   ImageAssets.me,
   ImageAssets.me
 ];
 var listDescription=[

 ];
}