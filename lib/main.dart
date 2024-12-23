import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_app/firebase_options.dart';
import 'package:mini_social_app/pages/login.dart';
import 'package:mini_social_app/pages/register.dart';
import 'package:mini_social_app/theme/lightTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: Register(),
    );
  }
}
