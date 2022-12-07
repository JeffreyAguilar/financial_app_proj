import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:financial_app/ui/child_signup_screen.dart';

import 'home_page.dart' as home;

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  late String childName;
  List<String> children = [];
  late String firstName;
  late String id;
  late String lastName;
  final _firstNameController = TextEditingController();

  final _incomeController = TextEditingController();
  final _choresController = TextEditingController();

  final _balanceController = TextEditingController();

  Future setInfo() async {
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    firstName = data.get('first name');
    lastName = data.get('last name');
    id = FirebaseAuth.instance.currentUser!.uid;
    children = List.from(data['children']);
    debugPrint('i am working adult');
  }

  late double income;
  late double balance;
  late double expenses;
  late String chores;
  late String email;
  late String childFirstName;
  late String childLastName;
  late String cid;
  late String status;

  Future setChildInfo() async {
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection('children')
        .doc('jasonmchenry')
        .get();
    balance = data.get('balance');
    chores = data.get('chore');
    email = data.get('email');
    expenses = data.get('expenses');
    childFirstName = data.get('first name');
    cid = data.get('id');
    income = data.get('income');
    childLastName = data.get('last name');
    status = data.get('status');

    debugPrint('i am working child');
  }

  Future upadteChildInfo() async {
    FirebaseFirestore.instance
        .collection('children')
        .doc('jasonmchenry')
        .update({
      'balance': balance,
      'chore': chores,
      'income': income,
    });

    debugPrint('i am working child');
  }

  @override
  Widget build(BuildContext context) {
    setInfo();
    setChildInfo();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 166, 8),
        title: const Text(
          'Edit Child Account',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
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
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _choresController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Chore',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _incomeController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Income',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _balanceController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Balance',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    chores = _choresController.text.trim();
                    income = 25;
                    balance = 300;
                    upadteChildInfo();

                    //debugPrint(
                    //'i am ' + income.toString() + ' ' + balance.toString());
                  },
                  child: const Text('Update', style: TextStyle(fontSize: 24)),
                ),
                Text('Current Balance: '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
