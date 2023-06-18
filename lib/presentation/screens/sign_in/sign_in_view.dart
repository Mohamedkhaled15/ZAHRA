import 'package:flutter/material.dart';
import 'package:zahra/presentation/resources/assets_manager.dart';


import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/styles_manger.dart';
import '../../component/continue_button.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: ColorManager.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'WelcomeBack',
                  style: getBoldStyle(color: ColorManager.black),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  ImageAssets.me,
                  scale: 3,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: ColorManager.darkSecondary,
                      fontSize: FontSize.s22,
                      fontFamily: 'Poppins'),
                  cursorColor: ColorManager.secondary,
                  onChanged: (value){
                    email=value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    labelStyle: TextStyle(color: ColorManager.lightSecondary),
                    fillColor: ColorManager.white,
                    filled: true,
                    hintText: 'أدخل اسمك الكامل',
                    hintTextDirection: TextDirection.rtl,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  style: TextStyle(
                      color: ColorManager.darkSecondary,
                      fontSize: FontSize.s22,
                      fontFamily: 'Poppins'),
                  cursorColor: ColorManager.secondary,
                  onChanged: (value){
                    password=value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    labelStyle: TextStyle(color: ColorManager.lightSecondary),
                    fillColor: ColorManager.white,
                    filled: true,
                    hintText: 'كلمة السر',
                    hintTextDirection: TextDirection.rtl,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height:65 ,
                    decoration: BoxDecoration(
                      color: ColorManager.darkSecondary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextButton(
                      onPressed: () async{

                       try{
                         final user= await _auth.
                       signInWithEmailAndPassword(email: email, password: password);
                          Navigator.pushNamed(context, Routes.mainLayout);
                       }catch(error){
                         print(error);
                       }



                      },
                      child: Text('Login',style: getNormalStyle(color: ColorManager.white),),
                    ),

                  ),
                ),

                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
