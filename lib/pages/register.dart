import 'package:flutter/material.dart';
import 'package:mini_social_app/components/custom_button.dart';
import 'package:mini_social_app/components/custom_textfield.dart';

class Register extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 100),

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
                onTap: () {},
              ),

              const SizedBox(height: 10),

              // Redirection to Regiter page TODO: make the redirection
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
                    onTap: () {},
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
