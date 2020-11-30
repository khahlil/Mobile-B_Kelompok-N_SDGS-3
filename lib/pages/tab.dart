import 'package:e_Masker/control/style.dart';
import 'package:e_Masker/pages/timerCount.dart';
import 'package:e_Masker/pages/timerHistory.dart';
import 'package:flutter/material.dart';

class TabPages extends StatefulWidget {
  @override
  _TabPagesState createState() => _TabPagesState();
}

class _TabPagesState extends State<TabPages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "e-Masker",
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(textTheme: TextTheme(headline6: AppBarTextStyle)),
          textTheme:
              TextTheme(subtitle1: TitleTextStyle, bodyText2: Body1TextStyle)),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: menu(),
          ),
          body: TabBarView(
            children: [
              TimerHistoryPages(),
              TimerCountPages(),
              TimerCountPages()
            ],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            icon: Icon(Icons.assignment),
          ),
          Tab(
            icon: Icon(Icons.edit),
          ),
          Tab(
            icon: Icon(Icons.alarm),
          )
        ],
      ),
    );
  }
}
