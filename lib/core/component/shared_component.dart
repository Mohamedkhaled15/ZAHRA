import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(BuildContext ctx, Widget nextScreen) {
  Navigator.push(ctx, MaterialPageRoute(builder: (_) => nextScreen));
}

////////////////
void navigateAndFinish(BuildContext ctx, Widget nextScreen) {
  Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (_) => nextScreen));
}


showToast({
  required String message,
  required ToastStates state,
  Toast length = Toast.LENGTH_SHORT,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: length,
    timeInSecForIosWeb: 5,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates {
  SUCCESS,
  ERROR,
  WARNING,
}
Color chooseToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.SUCCESS:
      return Colors.green;
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.WARNING:
      return Colors.amber;
  }
}
