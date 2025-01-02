
import 'package:flutter/material.dart';
import 'package:mini_social_app/helper/auth_helper.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  void logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/', // Navigue vers la racine où AuthPage est monté
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DrawerHeader(
            child: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          const SizedBox(height: 25),

          // Home tile
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text("H O M E"),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to the Home page
                    Navigator.pushReplacementNamed(context, '/home_page');

                  },
                ),
              ),

              // Profile tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("P R O F I L E"),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to the Profile page
                    Navigator.pushReplacementNamed(context, '/profile_page');
                  },
                ),
              ),

              // Users tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.group),
                  title: Text("U S E R S"),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to the Users page
                    Navigator.pushReplacementNamed(context, '/users_page');
                  },
                ),
              ),
            ],
          ),

          // Logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("L O G O U T"),
              onTap: () {
                // pop the drawer
                Navigator.pop(context);
                // logout
                logout(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
