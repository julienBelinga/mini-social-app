import 'package:flutter/material.dart';
import 'package:mini_social_app/components/custom_button.dart';
import 'package:mini_social_app/components/custom_textfield.dart';

class Login extends StatelessWidget {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),

              // App Logo
              Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 80,
              ),

              SizedBox(height: 50),

              // Email text field
              CustomTextfield(
                textHint: "e-mail",
                obscureText: false,
                controller: mailController,
              ),

              SizedBox(height: 25),

              //password text field
              CustomTextfield(
                textHint: "password",
                obscureText: true,
                controller: passwordController,
              ),

              SizedBox(height: 10),

              // Password forgotten link TODO: convert the text into a link
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "forgot password ?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50),

              // Login Button
              CustomButton(
                text: "Login",
                onTap: () {},
              )

              // Register page redirection
            ],
          ),
        ),
      ),
    );
  }
}
