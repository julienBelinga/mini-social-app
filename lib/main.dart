import 'package:flutter/material.dart';
import 'package:mini_social_app/pages/login.dart';
import 'package:mini_social_app/theme/lightTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: Login(),
    );
  }
}
