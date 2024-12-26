import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
