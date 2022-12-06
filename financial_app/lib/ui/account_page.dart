import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_app/ui/home_page.dart';
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
  String firstName = '';
  String id = '';
  String lastName = '';
  String email = '';

  Future setInfo() async {
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    String firstName = data.get('first name');
    String lastName = data.get('last name');
    String id = FirebaseAuth.instance.currentUser!.uid;
    String? email = FirebaseAuth.instance.currentUser!.email;
  }

  @override
  Widget build(BuildContext context) {
    setInfo();
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
                  Text(
                    firstName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(color: Colors.black),
                  ),
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
                  ),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('email is ' + email);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Sign Out'),
                  ),
                ]),
          ),
        ));
  }
}
