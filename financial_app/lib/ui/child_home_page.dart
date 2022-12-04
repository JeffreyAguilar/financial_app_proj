import 'package:financial_app/ui/child_acc_info.dart';
import 'package:flutter/material.dart';

class ChildHomePage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const ChildHomePage({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<ChildHomePage> createState() => _ChildHomePageState();
}

class _ChildHomePageState extends State<ChildHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 166, 8),
          title: const Text('Home Page',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.account_circle_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ChildAccInfo(title: 'Account Info');
                }));
              },
            )
          ],
        ),
        body: const AccountColumn());
  }
}

// ignore: slash_for_doc_comments
/// WidgetColumn class will display the widgets that
/// will navigate the user to the different finance graphs
class AccountColumn extends StatefulWidget {
  const AccountColumn({super.key});

  @override
  State<AccountColumn> createState() => _AccountColumnState();
}

class _AccountColumnState extends State<AccountColumn> {
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
              ])),
          child: SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Text(
                    'Graph',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Text(
                        'Account 1: ',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))),
    );
  }
}