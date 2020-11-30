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
    var duration = const Duration(seconds: 2);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return HomePages();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Image.asset('assets/images/logo-copy.png'),
    );

    final toHome = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        width: 200.0,
        height: 42.0,
        color: Colors.lightBlueAccent,
        child: Center(
          child:
              Text('Selamat Datang !', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            toHome,
          ],
        ),
      ),
    );
  }
}
