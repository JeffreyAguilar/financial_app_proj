import 'package:flutter/material.dart';

class AccInfo extends StatelessWidget {
  const AccInfo({super.key, required this.title});
  
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Info'),
      ),
    );
  }
}