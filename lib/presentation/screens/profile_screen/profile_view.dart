import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zahra/presentation/screens/profile_screen/profile_controller.dart';
import '../../component/item_drawer.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String _name="";
  String _email="";
  String _password="******";
  @override
  void initState() {

    super.initState();
   // controller.getCurrentUser();
    _loadSavedData();
  }
  _loadSavedData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('key_name')!=null
          &&sharedPreferences.getString('key_name')!.isNotEmpty) {
        _name = sharedPreferences.getString('key_name')!;
      }
      else{
        _name=' enter your name';
      }
      if(sharedPreferences.getString('key_email')!=null&&sharedPreferences.getString('key_email')!.isNotEmpty) {
        _email = sharedPreferences.getString('key_email')!;
      }else{
        _email=' enter your email';
      }
      if(sharedPreferences.getString('key_password')!=null&&sharedPreferences.getString('key_password')!.isNotEmpty) {
        _password = sharedPreferences.getString('key_password')!;
      }else{
        _password='enter your password';
      }
    });
  }

  _saveData(String message,String em ,String pas )async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('key_name', message);
    sharedPreferences.setString('key_email', em);
    sharedPreferences.setString('key_password', pas);

  }

  // final _fireStore=FirebaseFirestore.instance;
  // final _auth=FirebaseAuth.instance;
  bool isEdited = false;
  bool isSelected = false;
  ProfileController controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        endDrawer: Drawer(
          backgroundColor: ColorManager.darkPage,
          child: const ItemDrawer(),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(right: AppSize.s14),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                boxShadow: [
                  BoxShadow(
                    // color: ColorManager.primary,
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 1),

                    // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: IconManager.drawer);
                    }),
                  ),
                  Text(
                    AppStrings.personalPage,
                    style: getBoldStyle(
                        color: ColorManager.darkSecondary,
                        fontSize: AppSize.s41),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: AppMargin.m18,
                  right: AppMargin.m18,
                  left: AppMargin.m18,
                  bottom: AppSize.s10),
              padding: const EdgeInsets.only(
                  top: AppSize.s5, left: AppPadding.p18, right: AppPadding.p22),
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: ColorManager.darkPage,
                borderRadius: BorderRadius.circular(AppSize.s25),
              ),
              child: Stack(
                children: [
                  Row(children: [
                    Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        isEdited = !isEdited;
                        isSelected = false;
                        setState(() {});
                      },
                      child: Container(
                          width: AppSize.s64,
                          height: AppSize.s33,
                          decoration: BoxDecoration(
                            color: ColorManager.darkSecondary,
                            borderRadius: BorderRadius.circular(AppSize.s25),
                          ),
                          child: Center(
                              child: Text(
                                AppStrings.edite,
                                style: getNormalStyle(color: ColorManager.white),
                              ))),
                    ),
                  ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () async{
                          isEdited = !isEdited;
                          _saveData(controller.name!,controller.email!,controller.password!);
                          print(_name);
                          isEdited = !isEdited;

                          // isEdited = !isEdited;
                          // isSelected = false;
                          // print(controller.password);
                          // print(controller.email);
                          // print(controller.name);

                         // try{
                         //   _fireStore.collection('profile').add({
                         //     'email':controller.signedInUser.email,
                         //     'name':controller.name,
                         //     'password':controller.password,
                         //
                         //   });
                          // final newUser= await _auth.
                           // createUserWithEmailAndPassword(
                           //     email: controller.email!,
                           //     password: controller.password!);
                           AlertDialog(title: Text('info saved'),);
                           //controller.getInfo();
                         // }catch(error){
                         //   print(error);
                         // }

                          setState(() {});
                        },
                        child: Container(
                            width: AppSize.s64,
                            height: AppSize.s33,
                            decoration: BoxDecoration(
                              color: ColorManager.darkSecondary,
                              borderRadius: BorderRadius.circular(AppSize.s25),
                            ),
                            child: Center(
                                child: Text(
                                  AppStrings.save,
                                  style: getNormalStyle(color: ColorManager.white),
                                ))),
                      ),
                    ),
                  ],
                  ),
                  //edit button
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p14, top: AppPadding.p54),
                    child: TextFormField(
                      style: TextStyle(
                          color: ColorManager.lightSecondary,
                          fontSize: FontSize.s22,
                          fontFamily: 'Poppins'),
                      cursorColor: ColorManager.secondary,
                      decoration: InputDecoration(


                        labelStyle:
                            TextStyle(color: ColorManager.lightSecondary),
                        fillColor: ColorManager.white,
                        filled: true,
                      ),
                      textDirection: TextDirection.rtl,
                      enabled: isEdited,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        AppStrings.name,
                        style: getBoldStyle(
                            color: ColorManager.darkSecondary,
                            fontSize: AppSize.s24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p14, top: AppPadding.p54),
                    child: TextFormField(
                      minLines: 1,
                      style: TextStyle(
                          color: ColorManager.darkSecondary,
                          fontSize: FontSize.s20,
                          fontFamily: 'Poppins'),
                      //name
                      onChanged: (value){
                        controller.name=value;
                      },
                      cursorColor: ColorManager.secondary,
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: _name,
                        labelStyle:
                            TextStyle(color: ColorManager.lightSecondary),
                        fillColor: ColorManager.white,
                        filled: true,
                      ),
                      enabled: isEdited,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, right: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        AppStrings.email,
                        style: getBoldStyle(
                            color: ColorManager.secondary,
                            fontSize: AppSize.s25),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: AppPadding.p14, top: 140),
                    child: TextFormField(

                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          color: ColorManager.secondary,
                          fontSize: FontSize.s22,
                          fontFamily: 'Poppins'),
                      cursorColor: ColorManager.secondary,

                        //email
                      onChanged: (value) {
                        controller.email=value;
                      },

                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: _email,
                        //hintText:controller.email,
                        labelStyle:
                            TextStyle(color: ColorManager.lightSecondary),
                        fillColor: ColorManager.white,
                        filled: true,
                      ),

                      textDirection: TextDirection.rtl,
                      enabled: isEdited,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 185, right: 5),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        AppStrings.password,
                        style: getBoldStyle(
                            color: ColorManager.darkSecondary,
                            fontSize: AppSize.s25),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: AppPadding.p14, top: 220),
                    child: TextFormField(
                      //password
                      onChanged: (value) {
                        controller.password=value;
                      },

                      style: TextStyle(
                          color: ColorManager.secondary,
                          fontSize: FontSize.s22,
                          fontFamily: 'Poppins'),
                      cursorColor: ColorManager.secondary,
                      obscureText: !isSelected,
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,

                        hintText:isSelected? _password:"*"*_password.length,


                      //  hintText: controller!.password,
                        labelStyle:
                            TextStyle(color: ColorManager.secondary),

                        prefixIcon: InkWell(
                            onTap: () {
                              isSelected = !isSelected;
                              setState(() {});
                            },
                            child: isSelected
                                ? IconManager.eyes
                                : IconManager.eyesClosed),
                        fillColor: ColorManager.white,
                        filled: true,
                      ),

                      textDirection: TextDirection.rtl,
                      enabled: isEdited,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: AppSize.s1_5,
              height: AppSize.s1,
              endIndent: AppSize.s50,
              indent: AppSize.s50,
              color: ColorManager.darkSecondary,
            ),
            Container(
                margin: const EdgeInsets.only(
                    top: AppMargin.m10,
                    right: AppMargin.m18,
                    left: AppMargin.m18,
                    bottom: AppSize.s10),
                padding: const EdgeInsets.only(
                    top: AppSize.s5,
                    left: AppPadding.p18,
                    right: AppPadding.p22),
                height: MediaQuery.of(context).size.height / 3 + 20,
                decoration: BoxDecoration(
                  color: ColorManager.darkPage,
                  borderRadius: BorderRadius.circular(AppSize.s25),
                ),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: Container(
                      height: AppSize.s60,
                      margin: const EdgeInsets.symmetric(vertical: AppSize.s7),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius: BorderRadius.circular(AppSize.s25),
                      ),
                      child: Center(
                        child: Text(
                          controller.list[index],
                          style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s26,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
