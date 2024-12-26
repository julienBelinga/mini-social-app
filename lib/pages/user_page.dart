import 'package:flutter/material.dart';
import 'package:mini_social_app/components/myDrawer.dart';
import 'package:mini_social_app/helper/auth_helper.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ), // Set drawer icon color to white
      ),
      drawer: Mydrawer(),
    );
  }
}
