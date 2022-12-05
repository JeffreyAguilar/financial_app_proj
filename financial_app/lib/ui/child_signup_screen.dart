import 'package:financial_app/constructors/local_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class ChildSignUpScreen extends StatefulWidget {
  const ChildSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChildSignUpScreen> createState() => _ChildSignUpScreenState();
}

class _ChildSignUpScreenState extends State<ChildSignUpScreen> {
  bool isChecked = false;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    String docId = collectionReference.doc().id;

    addUserDetails(
      _firstNameController.text.trim(),
      _lastNameController.text.trim(),
      _emailController.text.trim(),
      'child',
      FirebaseAuth.instance.currentUser!.uid,
      docId,
    );
  }

  Future addUserDetails(String firstName, String lastName, String email,
      String child, String id, String docId) async {
    await collectionReference.doc(docId).set({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'status': child,
      'id': id,
      'doc id': docId,
    });
    final FirebaseAuth auth = FirebaseAuth.instance;
    final String pid = FirebaseFirestore.instance.collection('users').id;
    debugPrint('id being printed ' + docId);
    FirebaseFirestore.instance
        .collection('users')
        .doc(pid)
        .update({'children': docId});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/flutter.png'),
          fit: BoxFit.cover,
        ),
      ),
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: TextField(
                controller: _firstNameController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'First Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: TextField(
                controller: _lastNameController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Last Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: TextField(
                controller: _emailController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: TextField(
                controller: _passwordController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                signUp();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 50.0,
                ),
                child: Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
