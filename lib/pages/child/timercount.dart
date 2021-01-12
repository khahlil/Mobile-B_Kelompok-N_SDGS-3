import 'package:e_Masker/controls/timecontrol/timerProvider.dart';
import 'package:e_Masker/pages/child/part/timer_clock.dart';
import 'package:e_Masker/controls/tabcontroller.dart';
import 'package:e_Masker/controls/db_history.dart';
import 'package:e_Masker/models/m_history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class TimerCount extends StatefulWidget {
  final TimerProvider timerProvider;
  final int total;
  final int history;

  TimerCount({Key key, this.timerProvider, this.total, this.history})
      : super(key: key);

  TimerCountState createState() => TimerCountState();
}

class TimerCountState extends State<TimerCount> {
  Color leftButtonColor;
  Widget leftButtonText;
  Icon leftButtonIcon;
  int countHistory;
  int countMasker = 0;
  Timer timer;

  var date = new DateTime.now();

  updateTime(Timer timer) {
    if (widget.timerProvider.stopwatch.isRunning) {
      setState(() {});
    } else {
      timer.cancel();
    }
  }

  @override
  void initState() {
    if (widget.timerProvider.stopwatch.isRunning) {
      timer = new Timer.periodic(new Duration(milliseconds: 20), updateTime);
      leftButtonIcon = Icon(Icons.stop);
      leftButtonColor = Colors.red;
      leftButtonText = Text('STOP');
    } else {
      leftButtonIcon = Icon(Icons.play_arrow);
      leftButtonColor = Colors.green;
      leftButtonText = Text('START');
    }
    super.initState();
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
      timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int total = TabProvider.of(context).total;
    countMasker = total;
    int history = TabProvider.of(context).history;
    history != null ? countHistory = history : countHistory = 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 80.0),
        Container(
          height: 250.0,
          width: 250.0,
          child: TimerClock(widget.timerProvider),
        ),
        SizedBox(height: 220.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: leftButtonColor,
              textColor: Colors.white,
              onPressed: startOrStopWatch,
              child: Row(children: [leftButtonIcon, leftButtonText]),
            ),
          ],
        ),
      ],
    );
  }

  startOrStopWatch() {
    if (countMasker - countHistory <= 0)
      showMaterialDialog();
    else {
      if (widget.timerProvider.stopwatch.isRunning) {
        leftButtonIcon = Icon(Icons.play_arrow);
        leftButtonColor = Colors.green;
        leftButtonText = Text('START');
        setState(() {
          if (widget.timerProvider.stopwatch.isRunning) {
            widget.timerProvider.stopwatch.stop();
            var lap = widget.timerProvider.msToString(
                widget.timerProvider.stopwatch.elapsedMilliseconds);
            simpan(lap);
            widget.timerProvider.stopwatch.reset();
            final controller = TabProvider.of(context).tabController;
            controller.index = 0;
          }
        });
      } else {
        leftButtonIcon = Icon(Icons.pause);
        leftButtonColor = Colors.red;
        leftButtonText = Text('STOP');
        widget.timerProvider.stopwatch.start();
        timer = new Timer.periodic(new Duration(milliseconds: 20), updateTime);
      }
    }
  }

  String createListItemText(int listSize, int index, String time) {
    index = listSize - index;
    String indexText = index.toString().padLeft(2, '0');
    return 'Time $indexText, $time';
  }

  todayDate() {
    var formatter = new DateFormat('dd-MMMM-yyyy').format(date);
    return formatter;
  }

  todayDay() {
    var formatter = new DateFormat('EEEE').format(date);
    return formatter;
  }

  todayTime() {
    var formatter = new DateFormat('kk:mm:a').format(date);
    return formatter;
  }

  simpan(String lap) async {
    History history = History(todayTime(), lap, todayDay(), todayDate());
    addHistory(history);
  }

  showMaterialDialog() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text("Masker tidak cukup!"),
        actions: <Widget>[
          FlatButton(
            child: Text('Tambah'),
            onPressed: () {
              Navigator.pop(context);
              final controller = TabProvider.of(context).tabController;
              controller.index = 1;
            },
          )
        ],
      ),
    );
  }

  void addHistory(History object) async {
    DbHistory dbHistory = DbHistory();
    await dbHistory.initDb();
    await dbHistory.insert(object);
  }
}
