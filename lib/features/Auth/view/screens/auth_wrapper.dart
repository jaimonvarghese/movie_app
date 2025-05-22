
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/Auth/view/screens/sigin_screen.dart';
import 'package:movie_app/features/home/view/screens/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return const HomeScreen();
    } else {
      return const SignInScreen(); 
    }
  }}