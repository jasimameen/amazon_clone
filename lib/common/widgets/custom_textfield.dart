// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;

  final bool obscureText;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hintText must not be empty';
        }
        return null;
      },
      obscureText: obscureText,
    );
  }
}
