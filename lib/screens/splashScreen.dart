// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:async';
import 'package:dashboard/model/model.dart';
import 'package:dashboard/screens/login.dart';
import 'package:dashboard/screens/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? tokenExpirationString = prefs.getString('refreshTokenExpiration');

    

    // Compare the token expiration date with the current date and time
    if (tokenExpirationString!=null) {
  Navigator.pushReplacement(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft, child: MainScreen()));
    }else{
      Navigator.pushReplacement(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft, child: MyLogin()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(image: AssetImage('assets/logoSplash.gif',
        
        ))
      ),
    );
  }
}
