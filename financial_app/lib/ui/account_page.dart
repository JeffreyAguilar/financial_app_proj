import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_app/ui/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:financial_app/main.dart';
import 'login_screen.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 166, 8),
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
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MainPage();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Sign Out'),
                  )
                ]),
          ),
        ));
  }
}

Widget buildName() => Column(
      children: const [
        Text(
          'bob',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          'Email',
          style: TextStyle(color: Colors.black),
        )
      ],
    );
