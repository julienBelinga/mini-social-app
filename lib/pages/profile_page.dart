import 'package:flutter/material.dart';
import 'package:mini_social_app/components/myDrawer.dart';
import 'package:mini_social_app/helper/auth_helper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ), // Set drawer icon color to white
        actions: [
          IconButton(
            onPressed: AuthHelper.logout,
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      drawer: Mydrawer(),
    );
  }
}
