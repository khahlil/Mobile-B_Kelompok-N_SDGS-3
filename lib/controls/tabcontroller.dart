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

  TabProvider({this.tabController, this.child});

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

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: menu()),
      body: TabProvider(
        tabController: _controller,
        child: TabBarView(
          controller: _controller,
          children: [HistoryPages(), AddMaskerPages(), TimerPages()],
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
