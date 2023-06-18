// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class AuthGoogle{
//
//
//   signInWithGoogle()async{
//
//     final GoogleSignInAccount ? googleSignIn = await GoogleSignIn().signIn();
//
//     final GoogleSignInAuthentication gooAuth = await googleSignIn!.authentication;
//
//     final credential = GoogleAuthProvider.credential(
//       accessToken: gooAuth.accessToken,
//       idToken: gooAuth.idToken,
//     );
//
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }