import 'package:flutter/material.dart';

class ChildAccountPage extends StatefulWidget {
  const ChildAccountPage({super.key});

  @override
  State<ChildAccountPage> createState() => _ChildAccountPageState();
}

class _ChildAccountPageState extends State<ChildAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 3, 166, 8),
        title: const Text('Account Info'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 3, 166, 8),
              Color.fromARGB(255, 94, 238, 168),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildName(),
              buildSignout(),
            ]
          ),
        ),
      )
    );
  }
}

Widget buildName() => Column(
  children: const [
    Text(
      'Name',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.white
      ),
    ),
     SizedBox(height: 4),
     Text(
      'Email',
      style: TextStyle(color: Colors.black),
     ),
     SizedBox(height: 4),
     Text(
      'Parent\'s Email',
      style: TextStyle(color: Colors.black),
     ),
  ],
);

Widget buildSignout() => ElevatedButton(
  onPressed: () {}, 
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  child: const Text('Sign Out'),
  );

