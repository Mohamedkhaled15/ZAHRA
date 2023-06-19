import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../resources/strings_manager.dart';


class ProfileController{
//   final _auth=FirebaseAuth.instance;
//   final _fireStore=FirebaseFirestore.instance;
//
//   late User signedInUser;
//   void getCurrentUser(){
//
//       try{
//         final user=_auth.currentUser;
//         if(user!=null){
//           signedInUser=user;
//           print(signedInUser);
//         }
//       }catch(e){print(e);}
//
//   }
//   void getInfo()async{
//    await for(var  snapshot in _fireStore.collection('profile').snapshots()){
//     for(var inf in snapshot.docs){
//     print(inf.data());
//     }
//
//     }
//
//   }
 String? name;
 String? password;
 String? email;

  var list=[
    AppStrings.medicinePlan,
    AppStrings.doctorShare,
    AppStrings.archive,
    AppStrings.con,

  ];
}