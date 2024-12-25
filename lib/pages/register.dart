import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_app/components/custom_button.dart';
import 'package:mini_social_app/components/custom_textfield.dart';
import 'package:mini_social_app/helper/helper_function.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;

  const Register({
    super.key,
    required this.onTap,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController mailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> registerUser() async {
    // display a loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //compare password
    if (passwordController.text != confirmPasswordController.text) {
      // loading circle pop
      Navigator.pop(context);

      // display error message
      displayErrorMessageToUser("Passwords don't match", context);
    } else {
      try {
        //create the user
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: mailController.text,
          password: passwordController.text,
        );

        //pop the loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop the loading circle
        Navigator.pop(context);

        // display error message
        displayErrorMessageToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),

              // App Logo
              Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 80,
              ),

              const SizedBox(height: 50),

              // username text field
              CustomTextfield(
                textHint: "Username",
                obscureText: false,
                controller: usernameController,
              ),

              const SizedBox(height: 25),

              // Email text field
              CustomTextfield(
                textHint: "e-mail",
                obscureText: false,
                controller: mailController,
              ),

              const SizedBox(height: 25),

              //password text field
              CustomTextfield(
                textHint: "password",
                obscureText: true,
                controller: passwordController,
              ),

              const SizedBox(height: 25),

              // confirm password text field
              CustomTextfield(
                textHint: "Confirm password",
                obscureText: true,
                controller: confirmPasswordController,
              ),

              const SizedBox(height: 50),

              // register Button
              CustomButton(
                text: "Register",
                onTap: registerUser,
              ),

              const SizedBox(height: 10),

              // Redirection to Register page
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              )

              // Register page redirection
            ],
          ),
        ),
      ),
    );
  }
}
