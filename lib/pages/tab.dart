import 'package:e_Masker/control/style.dart';
import 'package:e_Masker/pages/addMasker.dart';
import 'package:e_Masker/pages/seeHistory.dart';
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
          textTheme: TextTheme(
            subtitle1: Title1TextStyle,
            subtitle2: Title2TextStyle,
            bodyText1: Body1TextStyle,
            bodyText2: Body2TextStyle,
          )),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: menu(),
          ),
          body: TabBarView(
            children: [
              SeeHistoryPages(),
              AddMaskerPages(),
              AddMaskerPages()
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
