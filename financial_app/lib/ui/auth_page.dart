import 'package:financial_app/ui/signup_screen.dart';
import 'package:financial_app/ui/login_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(onClickedSignUp: toggle)
      : SignUpScreen(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
