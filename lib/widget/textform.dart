import 'package:flutter/material.dart';
import 'package:machinetask/widget/textformstyle.dart';

class CustomTextform extends StatelessWidget {
  const CustomTextform(
      {Key? key,
      required this.hint,
      required this.controller,
      this.validator,
      required this.obscureText,
      this.icon,
      this.type})
      : super(key: key);
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? type;
  final String? hint;
  final bool obscureText;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        keyboardType: type,
        validator: validator,
        controller: controller,
        style: simpleTextFieldStyle(Colors.green),
        decoration: textFieldInputDecoration(hint!, icon: icon));
  }
}
