import 'package:flutter/material.dart';

class ParentAccInfo extends StatefulWidget {
  const ParentAccInfo({super.key, required this.title});

  final String title;

  @override
  State<ParentAccInfo> createState() => _ParentAccInfoState();
}

class _ParentAccInfoState extends State<ParentAccInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 166, 8),
        title: const Text('Account Info',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold)),
      ),
      body: const AccountInformation(),
    );
  }
}

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
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
          ],
        )),
        
      ),
    );
  }
}