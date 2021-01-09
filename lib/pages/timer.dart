import 'package:e_Masker/controls/tabcontroller.dart';
import 'package:e_Masker/controls/db_history.dart';
import 'package:e_Masker/models/m_history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerPages extends StatefulWidget {
  const TimerPages({Key key}) : super(key: key);

  @override
  _TimerPagesState createState() => _TimerPagesState();
}

class _TimerPagesState extends State<TimerPages>
    with AutomaticKeepAliveClientMixin<TimerPages> {
  @override
  bool get wantKeepAlive => true;

  DbHistory dbHistory = DbHistory();
  History history;
  var now = new DateTime.now();

  @protected
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Container(
          child: simpan(),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }

  todayDate() {
    var formatter = new DateFormat('dd-MMMM-yyyy').format(now);
    return formatter;
  }

  todayTime() {
    var formatter = new DateFormat('kk:mm:a').format(now);
    return formatter;
  }

  todayDay() {
    var formatter = new DateFormat('EEEE').format(now);
    return formatter;
  }

  simpan() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.blue,
      textColor: Colors.white,
      splashColor: Colors.yellowAccent[50],
      child: Text('Stop'),
      onPressed: () {
        history = History(todayTime(), todayDay(), todayDate());
        addHistory(history);
      },
    );
  }

  void addHistory(History object) async {
    await dbHistory.initDb();
    int result = await dbHistory.insert(object);
    if (result > 0) {
      final controller = TabProvider.of(context).tabController;
      controller.index = 0;
    }
  }
}
