import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/constant/colors_manager.dart';
import '../../core/constant/image_assets_manager.dart';
import '../../core/constant/strings_manger.dart';
import '../../core/constant/values_manger.dart';
import '../../layout/shop_layout/main_layout.dart';
import '../screens/register_screen/register_view.dart';

class FaceBookAndGoogleItems extends StatefulWidget {
  const FaceBookAndGoogleItems({Key? key, this.text_one, this.text_two, this.onPressed,
  }) : super(key: key);
  final text_one;
  final text_two;
final   Function()?onPressed;

  @override
  State<FaceBookAndGoogleItems> createState() => _FaceBookAndGoogleItemsState();
}

class _FaceBookAndGoogleItemsState extends State<FaceBookAndGoogleItems> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                AppImageAsset.faceBook,
                height:
                MediaQuery.of(context).size.height /
                    15.5,
              ),
            ),
            SizedBox(
              width:
              MediaQuery.of(context).size.width / 5,
            ),
            InkWell(
                onTap: () {
                  googleSignInAction();

                },
                child: Image.asset(
                  AppImageAsset.google,
                  height: MediaQuery.of(context)
                      .size
                      .height /
                      15,
                )),

          ],
        ),
        SizedBox(
          height:
          MediaQuery.of(context).size.height / 105,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
           widget. text_one,
              style: TextStyle(
                color: ColorManager.black,
                fontSize: 15,
              ),
            ),
            TextButton(
              onPressed: widget.onPressed,
    // Get.to(
    // () =>onPressed,
    // );
              child: Text(
                widget. text_two,

                style: TextStyle(
                  fontSize: AppSize.s18,
                  decoration: TextDecoration.underline,
                  color: ColorManager.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<User?> googleSignInAction() async {
    final GoogleSignInAccount? googleSignInAccount =
    await (googleSignIn.signIn());
    final GoogleSignInAuthentication? googleSignInAuthentication =
    await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    final UserCredential authResult =
    await auth.signInWithCredential(credential);
    final User? user = authResult.user;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MainLayout()),
    );
    return user;
  }
}
