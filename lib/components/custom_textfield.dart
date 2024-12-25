import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String textHint;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextfield({
    super.key,
    required this.textHint,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: textHint,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          )),
      obscureText: obscureText,
    );
  }
}
