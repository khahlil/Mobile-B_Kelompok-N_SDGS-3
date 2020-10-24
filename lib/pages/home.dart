import 'package:e_Masker/controll/router.dart';
import 'package:e_Masker/pages/opening.dart';
import 'package:e_Masker/controll/tab.dart';
import 'package:e_Masker/pages/timer.dart';
import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home ver 1')),
      body: Center(child: Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Text('Header Area')),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Opening'),
              onTap: () {
                Navigator.pop(context);
                Router.changePage(context, OpeningPages());
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home ver 2'),
              onTap: () {
                Navigator.pop(context);
                Router.changePage(context, TabPages());
              },
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Timer'),
              onTap: () {
                Navigator.pop(context);
                Router.changePages(context, TimerPages());
              }
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Close'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
