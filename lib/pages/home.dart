import 'package:e_Masker/control/router.dart';
import 'package:e_Masker/pages/child/list.dart';
import 'package:e_Masker/pages/info.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aplikasi e-Masker')
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Image.asset('assets/images/logo-copy.png')),
              decoration: BoxDecoration(color: Colors.purple[50]),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Timer'),
              onTap: () {
                Navigator.pop(context);
                Router.changePages(context, TimerPages());
              },
            ),
            ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Router.changePages(context, InfoPages());
                }),
          ],
        ),
      ),
      
      body: Center(child: ListPages()),
    );
  }
}
