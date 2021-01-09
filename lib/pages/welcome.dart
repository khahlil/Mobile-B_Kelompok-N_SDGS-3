import 'dart:async';
import 'package:e_Masker/pages/home.dart';
import 'package:flutter/material.dart';

class WelcomePages extends StatefulWidget {
  @override
  _WelcomePagesState createState() => new _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePages> {
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 1);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return HomePages();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.0, left: 30.0, right: 30.0),
          child: Hero(
            tag: 'hero',
            child: Image.asset('assets/images/logo-copy.png'),
          ),
        ),
      ),
    );
  }
}
