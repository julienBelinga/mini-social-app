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
      controller: this.controller,
      decoration: InputDecoration(
        hintText: this.textHint,
      ),
      obscureText: this.obscureText,
    );
  }
}
