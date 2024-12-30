import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  static Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      // Redirection après la déconnexion
      // Navigator.of(context).pushReplacementNamed('/login_register_page');
    } catch (e) {
      // En cas d'erreur, afficher un message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la déconnexion : $e')),
      );
    }
  }
}
