import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_app/components/custom_button.dart';
import 'package:mini_social_app/components/custom_textfield.dart';
import 'package:mini_social_app/helper/helper_function.dart';

class Login extends StatelessWidget {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final void Function()? onTap;

  Login({super.key, required this.onTap});

  void login(BuildContext context) async {
    // display the loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // try sign-in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mailController.text,
        password: passwordController.text,
      );

      // pop the loading circle
      if (context.mounted) Navigator.of(context).pop();
    } on FirebaseException catch (e) {
      // pop the loading circle
      Navigator.of(context).pop();
      displayErrorMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Automatically adjust for keyboard
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          // Wrap Column in SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensure it fits within available space
              children: <Widget>[
                const SizedBox(height: 100),

                // App Logo
                Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 80,
                ),

                const SizedBox(height: 50),

                // Email text field
                CustomTextfield(
                  textHint: "e-mail",
                  obscureText: false,
                  controller: mailController,
                ),

                const SizedBox(height: 25),

                // Password text field
                CustomTextfield(
                  textHint: "password",
                  obscureText: true,
                  controller: passwordController,
                ),

                const SizedBox(height: 10),

                // Password forgotten link
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "forgot password?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // Login Button
                CustomButton(
                  text: "Login",
                  onTap: () => login(context),
                ),

                const SizedBox(height: 10),

                // Redirection to Register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Register here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
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
