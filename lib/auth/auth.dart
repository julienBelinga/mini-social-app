import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_app/pages/home_page.dart';
import 'package:mini_social_app/auth/login_or_register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = true; // Indicateur de chargement initial
  Widget _currentPage = const Center(
      child: CircularProgressIndicator()); // Page affichée par défaut

  @override
  void initState() {
    super.initState();

    // Écouter les changements d'état d'authentification
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (mounted) {
        setState(() {
          _isLoading = false; // Le chargement est terminé
          if (user == null) {
            print('auth : user logged out');
            _currentPage = const LoginOrRegister();
          } else {
            print('auth : user logged-in');
            _currentPage = const HomePage();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Affiche un chargement
          : _currentPage, // Affiche la page déterminée
    );
  }
}
