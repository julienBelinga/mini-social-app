import 'package:flutter/material.dart';
import 'package:mini_social_app/pages/login.dart';
import 'package:mini_social_app/pages/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<StatefulWidget> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially show the login page
  bool showLoginPage = true;

  // toggle between the two pages
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(onTap: togglePage);
    } else {
      return Register(onTap: togglePage);
    }
  }
}
