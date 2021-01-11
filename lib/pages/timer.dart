import 'package:e_Masker/controls/timecontrol/dependencies.dart';
import 'package:e_Masker/pages/child/timercount.dart';
import 'package:flutter/material.dart';

class TimerPages extends StatefulWidget {
  const TimerPages({Key key}) : super(key: key);

  @override
  _TimerPagesState createState() => _TimerPagesState();
}

class _TimerPagesState extends State<TimerPages>
    with AutomaticKeepAliveClientMixin<TimerPages> {
  final Dependencies dependencies = new Dependencies();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.0),
        child: TimerCount(dependencies: dependencies),
      ),
    );
  }
}
