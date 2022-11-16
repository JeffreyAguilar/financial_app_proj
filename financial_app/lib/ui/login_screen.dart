import 'package:financial_app/local_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  String login = '';
  String password = '';

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
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20.0),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'login',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      login = value;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0
                  ),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'password',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Remember Me',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value){
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ]
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () async {
                    if (localAuth(login: login, password: password)){
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('saveUser', isChecked);
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, '/home');
                    }
                    else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error!'),
                          content: const Text('Incorrect login information!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: (() => Navigator.pop(context, 'Try Again!')),
                              child: const Text('Try Again!'),
                            )
                          ],
                        )
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 50.0,
                    ),
                    child: Text('Enter'),
                  ),
                )
            ],
          ),
        ),
      )
    );
  }
}