import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashDelay();
  }

  void splashDelay() async{
    bool skipLogin = false;
    final prefs = await SharedPreferences.getInstance();
    final bool? saveUser = prefs.getBool('saveUser');
    if(saveUser != null){
      skipLogin = saveUser;
    }

    await Future.delayed(
      const Duration(seconds: 4),
    );

    //include if(skipLogin) block (will either lead user to login screen or into the app)
    if(skipLogin){
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/home',);
    }
    else{
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/login',);
    }
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
      ),
    );
  }
}