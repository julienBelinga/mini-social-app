import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_app/components/myAppbar.dart';
import 'package:mini_social_app/components/myDrawer.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // Current User logged in
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // Future fetching the user detail
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const MyAppbar(title: 'P R O F I L E'),
      drawer: const Mydrawer(),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading ...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // catching potential error
          else if (snapshot.hasError) {
            return Text("Error : ${snapshot.error}");
          }

          // data received
          else if (snapshot.hasData) {
            // extract data
            Map<String, dynamic>? user = snapshot.data!.data();

            return Center(
              child: Column(
                children: [
                  Text(user!['username']),
                  Text(user['email']),
                ],
              ),
            );
          }

          // if there is nothing
          else {
            return const Text('no data');
          }
        },
      ),
    );
  }
}
