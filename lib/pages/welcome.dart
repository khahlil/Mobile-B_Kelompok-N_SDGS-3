import 'package:e_Masker/controls/sharedPref.dart';
import 'package:e_Masker/pages/home.dart';
import 'package:e_Masker/pages/openingscreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
    var duration = const Duration(seconds: 2);
    return new Timer(duration, () {
      home();
    });
  }

  home() async {
    await SharedPreferencesHelper.getInstance();
    var a = SharedPreferencesHelper.getInt("skipPage");
    a == null ? a = 0 : a = a;
    if (a == 1) {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return HomePages();
      }));
    } else {
      SharedPreferencesHelper.putInt("skipPage", 1);
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return OpeningPages();
      }));
    }
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
