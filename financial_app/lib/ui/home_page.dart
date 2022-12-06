import 'package:flutter/material.dart';
import 'package:financial_app/ui/account_page.dart';
import 'package:financial_app/ui/manage_child.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> children = [];
  late String firstName;
  late String id;
  late String lastName;

  Future setInfo() async {
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    firstName = data.get('first name');
    lastName = data.get('last name');
    id = FirebaseAuth.instance.currentUser!.uid;
  }

  Future addChild(
    String childid,
  ) async {
    debugPrint('i am the' + id);
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'children': FieldValue.arrayUnion([childid])
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 166, 8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.account_circle_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  setInfo();
                  addChild('test');
                  debugPrint('i am ' + id);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MainPage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Sign Out'),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ManagePage();
                  }));
                },
              )
            ],
          )),
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
      ),
    );
  }
}
