import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_app/ui/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:financial_app/ui/login_screen.dart';
import 'package:financial_app/ui/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:financial_app/test.dart' as test;

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return AuthPage();
            }
          }),
    );
  }
}
