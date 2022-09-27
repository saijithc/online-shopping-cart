import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(
  String hintText, {
  Icon? icon,
}) {
  return InputDecoration(
    prefixIcon: icon,
    contentPadding: const EdgeInsets.all(10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    fillColor: Colors.white,
    filled: true,
    labelText: hintText,
    labelStyle:
        const TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
  );
}

TextStyle simpleTextFieldStyle(colors) {
  return TextStyle(color: colors);
}
