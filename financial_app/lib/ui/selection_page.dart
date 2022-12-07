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
        image: DecorationImage(
          image: AssetImage('images/gradient.png'),
          fit: BoxFit.cover,
        ),
      ),
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 50.0,
                ),
                child: Text('Sign In'),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ChildHomePage();
                }));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 50.0,
                ),
                child: Text('Sign In As Child'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
