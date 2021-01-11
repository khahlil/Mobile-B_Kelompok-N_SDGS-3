import 'package:e_Masker/controls/sharedPref.dart';
import 'package:e_Masker/pages/addMasker.dart';
import 'package:e_Masker/pages/history.dart';
import 'package:e_Masker/pages/timer.dart';
import 'package:flutter/material.dart';

class TabPages extends StatefulWidget {
  @override
  TabPagesState createState() => TabPagesState();
}

class TabProvider extends InheritedWidget {
  final TabController tabController;
  final Widget child;
  final int total;
  final int history;

  TabProvider({this.tabController, this.child, this.total, this.history});

  @override
  bool updateShouldNotify(TabProvider oldWidget) {
    return true;
  }

  static TabProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TabProvider>();
}

class TabPagesState extends State<TabPages>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int updateTotal = 0;
  int updateHistory = 0;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    getFuture();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  changedTotal(int text) {
    setState(() {
      updateTotal += text;
      setFuture();
    });
  }

  changedHistory(int text) {
    setState(() {
      updateHistory = text;
    });
  }

  setFuture() async {
    await SharedPreferencesHelper.getInstance();
    SharedPreferencesHelper.putInt("totalMasker", updateTotal);
  }

  getFuture() async {
    await SharedPreferencesHelper.getInstance();
    var a = SharedPreferencesHelper.getInt("totalMasker");
    updateTotal = a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: menu()),
      body: TabProvider(
        tabController: _controller,
        total: updateTotal,
        history: updateHistory,
        child: TabBarView(
          controller: _controller,
          children: [
            HistoryPages(changeHistory: changedHistory),
            AddMaskerPages(changeTotal: changedTotal),
            TimerPages()
          ],
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      child: TabBar(
        controller: _controller,
        tabs: [
          Tab(icon: Icon(Icons.assignment)),
          Tab(icon: Icon(Icons.edit)),
          Tab(icon: Icon(Icons.timer))
        ],
      ),
    );
  }
}
