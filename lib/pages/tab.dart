import 'package:e_Masker/control/style.dart';
import 'package:e_Masker/pages/welcome.dart';
import 'package:e_Masker/pages/openingscreen.dart';
import 'package:e_Masker/pages/timer.dart';
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
            // backgroundColor: Color(0xFF3F5AA6),
            title: Text("Timer"),
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [TimerPages(), TimerPages(), TimerPages()],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Color(0xFF3F5AA6),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            //...page timer history
            // text: "Transactions",
            icon: Icon(Icons.euro_symbol),
          ),
          Tab(
            //...page timer count
            // text: "Bills",
            icon: Icon(Icons.assignment),
          ),
          Tab(
            //...page input total masker
            // text: "Balance",
            icon: Icon(Icons.account_balance_wallet),
          )
        ],
      ),
    );
  }
}
