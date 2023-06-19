import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zahra/core/constant/strings_manger.dart';
import 'package:zahra/core/constant/values_manger.dart';
import 'package:zahra/view/screens/main_screen/main_view.dart';
import 'package:zahra/view/screens/register_screen/register_view.dart';

import '../../../core/component/default_button.dart';
import '../../../core/component/shared_component.dart';
import '../../../core/constant/colors_manager.dart';
import '../../../core/constant/font_manager.dart';
import '../../../core/constant/image_assets_manager.dart';
import '../../../data/model/register_model/register.dart';
import '../../../data/services/auth_google.dart';
import '../../../layout/shop_layout/cubit/cubit.dart';
import '../../../layout/shop_layout/main_layout.dart';
import '../../../shared/constant/constant.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/face_google_signup.dart';
import '../../widget/register_by.dart';
import '../home_screen/home_view.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LogIn extends StatefulWidget {

  LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopLoginCubit>(
      create: (_) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (ctx, state) {
          var loginCubit = ShopLoginCubit.get(ctx);
          if (state is ShopLoginSuccessState) {
            if (state.userDataModel.status!) {
              CacheHelper.saveDataInSharedPreferences(
                key: 'userToken',
                value: state.userDataModel.data!.token,
              ).then((value) {
                userToken = state.userDataModel.data!.token;
                debugPrint('Login Token ---> $userToken');

                ShopCubit shopCubit = ShopCubit.get(ctx);
                shopCubit.getUserData();
                showToast(
                  message: state.userDataModel.message!,
                  state: ToastStates.SUCCESS,
                );
                loginCubit.isButtonLoginClicked = false;

                navigateAndFinish(ctx, const MainLayout());
              });
            } else {
              // Email or password incorrect
              showToast(
                message: state.userDataModel.message!,
                state: ToastStates.ERROR,
              );
              loginCubit.isButtonLoginClicked = false;
            }
          }
        },
        builder: (ctx, state) {
          ShopLoginCubit cubit = ShopLoginCubit.get(ctx);

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: ColorManager.primary,
                elevation: 0.0,
                iconTheme: IconThemeData(color: ColorManager.secondary),
                actions: [
                  IconButton(
                      onPressed: () async {
                        final googleSignIn = GoogleSignIn();
                        await googleSignIn.signOut();
                      },
                      icon:  Icon(
                        Icons.logout_outlined,
                        color: ColorManager.secondary,
                      )),
                ],
              ),
              backgroundColor: ColorManager.primary,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 68,
                    ),
                    const Text(
                      AppStrings.welcomeBack,
                      style: TextStyle(
                        fontWeight: FontWeightManager.light,
                        fontSize: AppSize.s33,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Image.asset(
                      AppImageAsset.welcomeScreen,
                      height: MediaQuery.of(context).size.height / 3.2,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              children: [
                                defaultTextField(
                                  controller: emailController,
                                  labelText: AppStrings.emailIsTextFormField,
                                  textColor: ColorManager.secondary,
                                  prefixIconData: Icons.email_outlined,
                                  keyboardType: TextInputType.emailAddress,
                                  validateFun: (value) {

                                    if (value != null && value.isEmpty) {
                                      return "يرجي إدخال عنوان بريدك ألكتروني صحيح";
                                    }
                                    return null;
                                  },
                                  onChangeFun: (value){
                                    email=value;
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50,
                                ),
                                defaultTextField(
                                  controller: passwordController,
                                  labelText: AppStrings.passwordIsTextFormField,
                                  textColor: ColorManager.secondary,
                                  prefixIconData: Icons.lock_outlined,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: cubit.isPasswordObscure,
                                  obscuringChr: '*',
                                  suffixIconData: cubit.icon,
                                  suffixPressed: () {
                                    cubit.changePasswordVisibility();
                                    setState(() {
                                    });
                                  },
                                  onSubmittedFun: (value) {
                                    if (formKey.currentState!.validate()) {
                                      cubit.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                  onChangeFun: (value){
                                    password=value;
                                  },
                                  validateFun: (value) {

                                    if (value != null && value.isEmpty) {
                                      return "كلمة المرور قصيرة جدا";
                                    }
                                    return null;
                                  },
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    AppStrings.forgetPassword,
                                    style: TextStyle(
                                      color: ColorManager.secondary,
                                      fontSize: AppSize.s16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                ),
                                ConditionalBuilder(
                                  condition: !cubit.isButtonLoginClicked,
                                  builder: (con) => defaultButton(
                                      text: AppStrings.checkedLogin,
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              16,
                                      backGround: ColorManager.secondary,
                                      fontWight: FontWeight.bold,
                                      onTap: ()async {
                                        try{
                                          final user= await _auth.
                                          signInWithEmailAndPassword(email: email, password: password);
                                        }catch(error){
                                          print(error);
                                        }

                                        if (formKey.currentState!.validate()) {
                                          FocusScope.of(context).unfocus();
                                          closeKeyboard(con);
                                          cubit.userLogin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                      }),
                                  fallback: (_) => const Center(
                                      child: CircularProgressIndicator()),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                ),
                                const RegisterByText(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60,
                                ),
                                 FaceBookAndGoogleItems(
                                  onPressed: (){
                                    Get.to(
                                    () =>Register(),
                                    );
                                  },
                                  text_one:AppStrings.noHaveAccount ,
                                  text_two:AppStrings.createAccount ,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
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
