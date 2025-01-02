import 'package:flutter/material.dart';
import 'package:mini_social_app/components/custom_textfield.dart';
import 'package:mini_social_app/components/myAppbar.dart';
import 'package:mini_social_app/components/myDrawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController newPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(title: 'H O M E'),
      drawer: const Mydrawer(),
      body: Column(
        children: [
          // Textfield box for the user to type
          CustomTextfield(
            textHint: "what about your day ?",
            obscureText: false,
            controller: newPostController,
          ),

          // Posts
        ],
      ),
    );
  }
}
