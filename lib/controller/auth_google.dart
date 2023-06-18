// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:zahra/layout/shop_layout/main_layout.dart';
//
// import '../core/constant/routes_manager.dart';
//
// class AuthController extends GetxController{
//   var displayUserName = ''.obs;
//   var displayUserPhoto = ''.obs;
//   var displayUserEmail = ''.obs;
//   var isSignedIn = false;
//   final GetStorage authBox = GetStorage();
//
//   FirebaseAuth? auth = FirebaseAuth.instance;
//   var googleSignIn = GoogleSignIn();
//
//
//
//   void googleSignUpApp()async {
//
//     try {
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       displayUserName.value = googleUser!.displayName!;
//       displayUserPhoto.value = googleUser.photoUrl!;
//       displayUserEmail.value = googleUser.email;
//
//       GoogleSignInAuthentication googleSignInAuthentication =
//       await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken,
//       );
//
//       await auth!.signInWithCredential(credential);
//
//       isSignedIn = true;
//       authBox.write("auth", isSignedIn);
//       update();
//
//       Get.to(
//             () => const ShopLayout(),
//       );
//     } catch (error) {
//       Get.snackbar(
//         'Error!',
//         error.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//       );
//     }
//
//   }
//
// }
// // Image.asset(
// //                                           AppImageAsset.google,
// //                                           height: MediaQuery.of(context)
// //                                                   .size
// //                                                   .height /
// //                                               15,
// //                                         )