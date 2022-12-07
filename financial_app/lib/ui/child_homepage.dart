import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_app/ui/child_account_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:financial_app/ui/child_homepage.dart';
import 'package:financial_app/global.dart' as globals;
import 'child_signup_screen.dart';
import 'home_page.dart';
import 'main_page.dart';
import 'manage_child.dart';

class ChildHomePage extends StatefulWidget {
  const ChildHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChildHomePage> createState() => _ChildHomePageState();
}

class _ChildHomePageState extends State<ChildHomePage> {
  double income = 0;
  double balance = 0;
  double expenses = 0;
  String chores = '';
  String email = '';
  String childFirstName = '';
  String childLastName = '';
  String cid = '';
  String status = '';

  final _expenseController = TextEditingController();

  late String money;

  Future setChildInfo() async {
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection('children')
        .doc('MikeMcHenry')
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
  }

  Future upadteChildInfo() async {
    FirebaseFirestore.instance
        .collection('children')
        .doc('MikeMcHenry')
        .update({
      'expenses': expenses,
    });
  }

  Future spendingMoney() async {
    if (balance - expenses <= 0) {
      money = ('YOU HAVE NO MUHNI, do not spend money that you do not have!');
    } else if (balance - expenses <= 100 && balance - expenses > 0) {
      money =
          ('You need to spend less MUHNI and Try to save more. You should ' +
              chores);
    } else if (balance - expenses >= 100 && balance - expenses <= 200) {
      money =
          ('You are saving up that MUHNI good job! If you want more you can ' +
              chores);
    } else {
      money = ('You are a MUHNI saving machine AMAZING JOB!');
    }
  }

  void _countdown() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        setChildInfo();
        spendingMoney();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _countdown();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 166, 8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Welcome ' + childFirstName),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MainPage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Sign Out'),
              ),
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
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Text('Balance (Total MUHNI): ' + balance.toString()),
                ),
                Text('Try to keep your Balance above your money spent (' +
                    (expenses).toString() +
                    ')'),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Text(
                      'Income (How much MUHNI you get): ' + income.toString()),
                ),
                Text('To get this MUHNI you have to, ' + chores),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Text('MUHNI Spent: ' + expenses.toString()),
                ),
                Text(money),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _expenseController,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Update Expenses (MUHNI spent)',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    expenses = expenses +
                        double.tryParse(_expenseController.text.trim())!;
                    upadteChildInfo();
                  },
                  child: const Text('Update', style: TextStyle(fontSize: 24)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
