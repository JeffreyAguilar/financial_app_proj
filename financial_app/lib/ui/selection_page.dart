import 'package:financial_app/ui/home_page.dart';
import 'package:financial_app/ui/main_page.dart';
import 'package:flutter/material.dart';

import 'child_homepage.dart';

class selectionPage extends StatefulWidget {
  const selectionPage({super.key});

  @override
  State<selectionPage> createState() => _selectionPageState();
}

class _selectionPageState extends State<selectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 3, 166, 8),
              Color.fromARGB(255, 94, 238, 168)
            ],
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20.0),
          ),
          onPressed: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          }),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 50.0,
            ),
            child: Text('Sign In As Parent'),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20.0),
          ),
          onPressed: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ChildHomePage();
            }));
          }),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 50.0,
            ),
            child: Text('Sign In As Parent'),
          ),
        ),
      ),
    );
  }
}

class FirebaseAuth {}
