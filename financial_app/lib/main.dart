import 'package:financial_app/ui/login_screen.dart';
import 'package:financial_app/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'ui/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/splash': (BuildContext context) => const SplashScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        '/home': (BuildContext context) => const HomePage(title: 'Home Page'),
      },
    );
  }
}
