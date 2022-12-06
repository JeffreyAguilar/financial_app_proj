import 'package:financial_app/ui/child_account_page.dart';
import 'package:flutter/material.dart';
import 'package:financial_app/ui/child_homepage.dart';

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
  List<String> userInfo = [
    'Name: ',
    'Balance: ',
    'Income Per Month: ',
    'Expenses Per Month: ',
    'Income Over A Period of Time: '
  ];
  List<String> accountInfo = [
    'John Doe',
    '\$1000',
    '\$1000',
    '\$1000',
    '\$1000'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 166, 8),
          title: const Text('Home Page'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.account_circle_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChildAccountPage();
                    },
                  ),
                );
              },
            ),
          ]),
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
          child: ListView.separated(
            itemCount: userInfo.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(userInfo[index]),
                  trailing: Text(accountInfo[index]),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
    );
  }
}
