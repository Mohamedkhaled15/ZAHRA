import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:zahra/presentation/component/variables.dart';
import 'package:zahra/view/screens/register_screen/cubit/cubit.dart';
import 'package:zahra/view/screens/register_screen/cubit/state.dart';


import '../../../core/component/check_box.dart';
import '../../../core/component/default_button.dart';
import '../../../core/component/shared_component.dart';

import '../../../core/constant/font_manager.dart';

import '../../../core/constant/strings_manger.dart';
import '../../../core/constant/values_manger.dart';

import '../../../layout/shop_layout/main_layout.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../shared/constant/constant.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/face_google_signup.dart';
import '../../widget/register_by.dart';

import '../log_in_screen/log_in_screen.dart';


class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  late String email;
  late String password;

  bool checkedBoxValue = false;

late User _user;
AccessToken? _accessToken;
final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopRegisterCubit>(
      create: (_) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
          listener: (ctx, state) {
            var registerCubit = ShopRegisterCubit.get(ctx);
            if (state is ShopRegisterSuccessState) {
              if (state.userDataModel.status!) {
                CacheHelper.saveDataInSharedPreferences(
                  key: 'userToken',
                  value: state.userDataModel.data!.token,
                ).then((value) async {
                  userToken = state.userDataModel.data!.token;
                  debugPrint('Register Token ---> $userToken');
                  ////////////////////
                  // ShopCubit shopCubit = ShopCubit.get(ctx);
                  // //
                  // shopCubit.getUserData();
                  ////////////////////
                  showToast(
                    message: state.userDataModel.message!,
                    state: ToastStates.SUCCESS,
                  );
                  registerCubit.isButtonRegisterClicked = false;
                  ////////////////////
                  // ignore: use_build_context_synchronously
                  navigateAndFinish(ctx,  const MainLayout ());
                });
              } else {
                // Email or password incorrect
                showToast(
                  message: state.userDataModel.message!,
                  state: ToastStates.ERROR,
                );
                registerCubit.isButtonRegisterClicked = false;
              }
            }
          },
          builder: (ctx, state) {
        ShopRegisterCubit cubit = ShopRegisterCubit.get(ctx);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: OrientationBuilder(builder: (context, orientation) {
            return Scaffold(
              backgroundColor: ColorManager.primary,
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    iconTheme: IconThemeData(color: ColorManager.secondary),
                    leading:                       IconButton(onPressed: ()async{

                      final googleSignIn = GoogleSignIn();
                      await   googleSignIn.signOut();
                    }, icon:const Icon(Icons.logout_outlined) ),

                    backgroundColor: ColorManager.primary,

                    pinned: true,
                    expandedHeight: 110,
                    collapsedHeight: 110,

                    flexibleSpace: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        const Center(
                          child: Text(
                            AppStrings.oneTextInLoginScreen,
                            style: TextStyle(
                              fontWeight: FontWeightManager.light,
                              fontSize: AppSize.s33,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            AppStrings.twoTextInLoginScreen,
                            style: TextStyle(
                              fontWeight: FontWeightManager.light,
                              fontSize: AppSize.s24,
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 18,
                        // ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Column(
                                    children: [
                                      defaultTextField(
                                          // suffixText: "دخل اسمك الكامل",
                                        onChangeFun: (value){
                                          loggedName=value;
                                        },
                                          labelText:
                                              AppStrings.nameIsTextFormField,
                                          controller: _nameController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          prefixIconData: Icons.person,
                                          textColor: ColorManager.secondary,
                                          validateFun: (val) {
                                            if (val != null && val.isEmpty) {
                                              return "يرجي إدخال اسم المستخدم الخاص بك";
                                            }
                                            return null;
                                          }

                                          ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                      defaultTextField(
                                        controller: _emailController,
                                        labelText:
                                            AppStrings.emailIsTextFormField,
                                        textColor: ColorManager.secondary,
                                        prefixIconData: Icons.email_outlined,
                                        keyboardType:
                                            TextInputType.emailAddress,

                                        validateFun: (value) {

                                          if (value != null && value.isEmpty) {
                                            return "يرجي إدخال عنوان بريدك ألكتروني صحيح";
                                          }

                                          return null;
                                        },
                                        onChangeFun: (value){
                                          email=value;
                                          loggedEmail=value;
                                        }
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                      defaultTextField(

                                        controller: _passwordController,
                                        labelText:
                                            AppStrings.passwordIsTextFormField,
                                        textColor: ColorManager.secondary,
                                        prefixIconData: Icons.lock_outlined,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: cubit.isPasswordObscure,
                                        obscuringChr: '*',
                                        suffixIconData: cubit.icon,
                                        suffixPressed: () {
                                          cubit.changePasswordVisibility();
                                          setState(() {});
                                        },

                                        validateFun: (value) {

                                          if (value != null && value.isEmpty) {
                                            return "كلمة المرور قصيرة جدا";
                                          }
                                          return null;
                                        },
                                          onChangeFun: (value){
                                            password=value;
                                            loggedPassword=value;
                                          }
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                      defaultTextField(
                                        controller: _phoneController,
                                        labelText:
                                            AppStrings.numberIsTextFormField,
                                        textColor: ColorManager.secondary,
                                        prefixIconData: Icons.phone_android,
                                        keyboardType: TextInputType.phone,
                                        validateFun: (value) {

                                          if (value != null && value.isEmpty) {
                                            return "يرجي إدخال رقم هاتفك";
                                          }
                                          return null;
                                        },
                                          onSubmittedFun: (_) {
                                            if (_formKey.currentState!.validate()) {
                                              cubit.userRegister(
                                                name: _nameController.text,
                                                email: _emailController.text,
                                                password: _passwordController.text,
                                                phone: _phoneController.text,

                                              );
                                            }
                                          }
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50,
                                ),
                                CheckBoxSelect(
                                  text_one: AppStrings.choiceOneSelectCheckBox,
                                  text_Two: AppStrings.choiceTwoSelectCheckBox,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30,
                                ),

                                ConditionalBuilder(
                                    condition: !cubit.isButtonRegisterClicked,
                                    builder: (con)=> defaultButton(
                                        text: AppStrings.defaultButton,
                                        width:
                                        MediaQuery.of(context).size.width / 1.5,
                                        height:
                                        MediaQuery.of(context).size.height / 16,
                                        fontWight: FontWeight.normal,
                                        backGround: ColorManager.secondary,
                                        onTap: () async{
                                          try{
                                            final user= await _auth.
                                            createUserWithEmailAndPassword(email: email,
                                                password: password);
                                          }catch(error){
                                            print(error);
                                          }
                                          if (_formKey.currentState!.validate()) {
                                            FocusScope.of(context).unfocus();

                                            cubit.userRegister(
                                              name: _nameController.text,
                                              email: _emailController.text,
                                              password:
                                              _passwordController.text,
                                              phone: _phoneController.text,

                                            );
                                          }

                                        }
                                    ),
                                  fallback: (_) => const Center(
                                      child: CircularProgressIndicator()),


                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30,
                                ),
                                const RegisterByText(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30,
                                ),
                                 FaceBookAndGoogleItems(
                                    onPressed: (){
                                      Get.to(
                                      () =>LogIn(),
                                      );
                                    },
                                  text_one:AppStrings.haveAccount,
                                  text_two: AppStrings.checkedLogin,

                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            );
          }),
        );
      },
          ),
    );
  }

  Future<User?> googleSignInAction ()async {

    final GoogleSignInAccount? googleSignInAccount = await (googleSignIn.signIn());
    final GoogleSignInAuthentication ? googleSignInAuthentication = await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(

      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    final UserCredential authResult = await auth.signInWithCredential(credential);
    final User? user = authResult.user;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainLayout()),);
    return user;
  }



}

// Future<void>signIn()async{
//
//   final LoginResult result = await FacebookAuth.i.login();
//   if(result.status == LoginStatus.success){
//     _accessToken = result.accessToken;
//   }
// }
