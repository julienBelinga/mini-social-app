import 'package:flutter/material.dart';
import 'package:mini_social_app/components/myAppbar.dart';
import 'package:mini_social_app/components/myDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppbar(title: 'H O M E'),
      drawer: Mydrawer(),
    );
  }
}
