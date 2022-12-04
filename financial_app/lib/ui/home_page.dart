import 'package:flutter/material.dart';
import 'package:financial_app/ui/account_page.dart';
import 'package:financial_app/ui/manage_child.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> children = ['John', 'Jane', 'Joe'];
  String accounts = '\'s Balance: \n Planned Expenses Per Month: \n Planned Income Per Month: \n Planned Income Over A Period: ';
  String balance = '\$1000\n';
  String plannedExpenses = '\$200\n'; 
  String plannedIncomePerMonth = '\$250\n';
  String plannedIncomePeriod = '\$300\n';

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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AccountPage();
                  }));
                },
              ),
              const Text('Home Page'),
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
        child: SafeArea(
          child: ListView.builder(
            itemCount: children.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text(children[index] + accounts),
                  trailing: Text(plannedExpenses + plannedIncomePerMonth + plannedIncomePeriod),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}