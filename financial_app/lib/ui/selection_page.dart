import 'package:flutter/material.dart';
import 'package:financial_app/ui/child_homepage.dart';
import 'package:financial_app/ui/home_page.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/gradient.png'),
          fit: BoxFit.cover,
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
    ));
  }
}

class FirebaseAuth {}
