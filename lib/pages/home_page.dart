import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_app/components/custom_textfield.dart';
import 'package:mini_social_app/components/myAppbar.dart';
import 'package:mini_social_app/components/myDrawer.dart';
import 'package:mini_social_app/components/post_button.dart';
import 'package:mini_social_app/components/custom_list_tile.dart';
import 'package:mini_social_app/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  // post controller
  final TextEditingController newPostController = TextEditingController();

  void postMessage() {
    // only post if the Textfield not blank
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    // clear the controller after the POST
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(title: 'H O M E'),
      drawer: const Mydrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                // Textfield box for the user to type
                Expanded(
                  child: CustomTextfield(
                    textHint: "what about your day ?",
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),

                PostButton(onTap: postMessage)
              ],
            ),
          ),

          // Posts
          StreamBuilder(
              stream: database.getPostsStream(),
              builder: (context, snapshot) {
                //show loading circle
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // get all the posts
                final posts = snapshot.data!.docs;

                // if there is not data?
                if (snapshot.data == null || posts.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child:
                          Text('Make the first post for everyone to see it !'),
                    ),
                  );
                }

                // return the ListView
                return Expanded(
                  child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        // get every posts
                        final post = posts[index];

                        // get data from each post
                        String message = post['PostMessage'];
                        String userEmail = post['UserEmail'];
                        Timestamp timestamp = post['TimeStamp'];

                        //return a listTile
                        return CustomListTile(
                          title: message,
                          subtitle: userEmail,
                        );
                      }),
                );
              })
        ],
      ),
    );
  }
}
