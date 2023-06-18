import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isPasswordObscure = true;
IconData icon = Icons.visibility;
void changePasswordVisibility() {
  isPasswordObscure = !isPasswordObscure;
  icon = isPasswordObscure ? Icons.visibility : Icons.visibility_off;

}
