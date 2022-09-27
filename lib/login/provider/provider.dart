import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:machinetask/home/view/home_screen.dart';
import 'package:machinetask/login/model/login_model.dart';
import 'package:machinetask/services/authentication.dart';
import 'package:machinetask/widget/customsnackbar.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController forgotEmailController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final forgotkey = GlobalKey<FormState>();
  bool loading = false;
  bool progress = false;
  validation(context) {
    if (formKey.currentState!.validate()) {
      // loading = true;

      final user = LoginUser(
          email: emailController.text.trim(),
          passWord: passwordController.text.trim());
      if (loading != true) {
        loading = true;
        notifyListeners();
        log("function called");
        Auth().signIn(user).then((value) {
          log("after sign in called");
          loading = false;
          notifyListeners();
          if (value == "sucess") {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const HomeScreen()));
            emailController.clear();
            passwordController.clear();
          } else {
            loading = false;
            notifyListeners();
            customSnackBar(context, value!);
            log("something went wrong");
          }
        });
      }
    }
  }
}
