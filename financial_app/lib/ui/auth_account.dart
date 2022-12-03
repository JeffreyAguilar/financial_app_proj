import 'package:financial_app/ui/home_page.dart';
import 'package:financial_app/ui/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//DOES NOT WORK CURRENTLY

class AuthAccountPage extends StatefulWidget {
  @override
  _AuthAccountPage createState() => _AuthAccountPage();
}

class _AuthAccountPage extends State<AuthAccountPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin ? HomePage() : SignUpScreen(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
