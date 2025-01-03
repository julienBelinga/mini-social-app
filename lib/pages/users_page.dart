import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_app/components/custom_list_tile.dart';
import 'package:mini_social_app/components/myAppbar.dart';
import 'package:mini_social_app/components/myDrawer.dart';
import 'package:mini_social_app/helper/helper_function.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(title: "U S E R S"),
      drawer: const Mydrawer(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          // check for errors
          if (snapshot.hasError) {
            displayErrorMessageToUser("Something went wrong", context);
          }

          // loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // if there isn't data
          if (snapshot.data == null) {
            return const Text("No data");
          }

          // Collect the data
          final users = snapshot.data!.docs;

          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                //get individual users
                final user = users[index];

                // display each user
                return CustomListTile(
                  title: user['username'],
                  subtitle: user['email'],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
