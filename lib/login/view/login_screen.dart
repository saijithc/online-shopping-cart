import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:machinetask/login/provider/provider.dart';
import 'package:machinetask/widget/customtext.dart';
import 'package:machinetask/widget/textform.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log('called');
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<LoginProvider>(
                      builder: (context, values, child) {
                        return Form(
                            key: values.formKey,
                            child: Column(children: [
                              SizedBox(
                                height: height * 0.4,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.black26,
                                      size: height * 0.2,
                                    ),
                                    customText("Welcome Back",
                                        color: Colors.black,
                                        weight: FontWeight.bold,
                                        sizes: 30),
                                    customText("Sign to continue",
                                        color: Colors.black26)
                                  ],
                                ),
                              ),
                              CustomTextform(
                                icon: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.green,
                                ),
                                obscureText: false,
                                // type: TextInputType.number,
                                hint: "EMAIL",
                                controller: values.emailController,
                                validator: (value) {
                                  return value!.length >= 8
                                      ? null
                                      : "Please provide a valid email id";
                                },
                              ),
                              SizedBox(height: height * 0.02),
                              CustomTextform(
                                  icon: const Icon(Icons.lock_outline),
                                  obscureText: false,
                                  hint: "PASSWORD",
                                  controller: values.passwordController,
                                  validator: (val) {
                                    return val!.length >= 6
                                        ? null
                                        : "Password should contain minimum 6 characters";
                                  })
                            ]));
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).push(PageRouteBuilder(
                            //     opaque: false,
                            //     pageBuilder: (_, __, ___) => const Forgot()));
                            // context.read<LoginProvider>().forgot();
                          },
                          child: customText(
                            "Forgot password ?",
                            color: Colors.green,
                            weight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SizedBox(
                      width: width,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            context.read<LoginProvider>().validation(context);
                          },
                          child: Consumer<LoginProvider>(
                            builder: (context, value, child) {
                              return value.loading
                                  ? const Center(
                                      child: SizedBox(
                                        height: 25,
                                        child: CircularProgressIndicator(
                                            color: Colors.white),
                                      ),
                                    )
                                  : Center(
                                      child: customText('LOGIN',
                                          color: Colors.white));
                            },
                          )),
                    ),
                    SizedBox(height: height * 0.05),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "Don't have account? ",
                                style: const TextStyle(color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  text: "create a new account",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold))
                            ]))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
