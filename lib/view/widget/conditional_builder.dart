// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../../core/component/default_button.dart';
// import '../../core/constant/colors_manager.dart';
// import '../../core/constant/strings_manger.dart';
//
// class ConditionalItem extends StatefulWidget {
//   const ConditionalItem({Key? key}) : super(key: key);
//
//   @override
//   State<ConditionalItem> createState() => _ConditionalItemState();
// }
//
// class _ConditionalItemState extends State<ConditionalItem> {
//   @override
//   Widget build(BuildContext context) {
//     return ConditionalBuilder(
//       condition: !cubit.isButtonLoginClicked,
//       builder: (con) => defaultButton(
//           text: AppStrings.checkedLogin,
//           width: MediaQuery.of(context).size.width /
//               1.2,
//           height:
//           MediaQuery.of(context).size.height /
//               16,
//           backGround: ColorManager.secondary,
//           fontWight: FontWeight.bold,
//           onTap: () {
//             if (formKey.currentState!.validate()) {
//               FocusScope.of(context).unfocus();
//               closeKeyboard(con);
//               cubit.userLogin(
//                 email: emailController.text,
//                 password: passwordController.text,
//               );
//             }
//           }),
//       fallback: (_) => const Center(
//           child: CircularProgressIndicator()),
//     );
//   }
// }
