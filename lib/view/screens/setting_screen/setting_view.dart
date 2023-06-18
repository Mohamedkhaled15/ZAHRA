// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../core/component/default_button.dart';
// import '../../../core/component/shared_component.dart';
// import '../../../layout/shop_layout/cubit/state.dart';
// import '../../widget/custom_text_form_field.dart';
// import '/layout/shop_layout/cubit/cubit.dart';
// import '/shared/constant/constant.dart';
//
// class SettingsScreen extends StatelessWidget {
//   SettingsScreen({Key? key}) : super(key: key);
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopCubit, ShopStates>(
//       listener: (ctx, state) {
//         if (state is ShopUpdateUserDataSuccessState) {
//           // get message if updating data sucessfully or not
//           showToast(
//             message: state.userDataModel.message!,
//             state: state.userDataModel.status!
//                 ? ToastStates.SUCCESS
//                 : ToastStates.ERROR,
//           );
//         }
//       },
//
//       builder: (ctx, state) {
//         var cubit = ShopCubit.get(ctx);
//         return Center(
//           child: defaultButton(
//              text: "Logout",
//             onTap: (){
//
//               userLogout(ctx);
//               cubit.currentIndexBottomNavigateBar = 1;
//             },
//             backGround: Colors.pink,
//             width:
//             MediaQuery.of(context).size.width / 1.5,
//             height:
//             MediaQuery.of(context).size.height / 16,
//             fontWight: FontWeight.bold,
//           ),
//         );
//       },
//     );
//   }
//   }
//
//
