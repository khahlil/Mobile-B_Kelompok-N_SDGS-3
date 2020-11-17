import 'package:e_Masker/control/router.dart';
import 'package:e_Masker/pages/home.dart';
import 'package:flutter/material.dart';

class WelcomePages extends StatefulWidget {
  @override
  _WelcomePagesState createState() => new _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePages> {
  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: Image.asset('assets/images/logo-copy.png'),
    );

    final toHome = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.lightBlueAccent.shade100,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          color: Colors.lightBlueAccent,
          child: Text('Selamat Datang !', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Router.changePage(context, HomePages());
          },
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
