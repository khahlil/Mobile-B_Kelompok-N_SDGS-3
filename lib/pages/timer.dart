import 'package:e_Masker/controls/tabcontroller.dart';
import 'package:e_Masker/controls/db_history.dart';
import 'package:e_Masker/models/m_history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerPages extends StatefulWidget {
  final int total;
  final int history;
  final ValueChanged<int> changeTotal;

  const TimerPages({Key key, this.total, this.changeTotal, this.history})
      : super(key: key);

  @override
  _TimerPagesState createState() => _TimerPagesState();
}

class _TimerPagesState extends State<TimerPages> {
  // with AutomaticKeepAliveClientMixin<TimerPages> {
  // @override
  // bool get wantKeepAlive => true;

  DbHistory dbHistory = DbHistory();
  History history;
  int countMasker = 0;
  int countHistory;

  @override
  Widget build(BuildContext context) {
    // super.build(context);

    int total = TabProvider.of(context).total;
    countMasker = total;
    int history = TabProvider.of(context).history;
    history != null ? countHistory = history : countHistory = 0;

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
    var formatter = new DateFormat('dd-MMMM-yyyy').format(DateTime.now());
    return formatter;
  }

  todayTime() {
    var formatter = new DateFormat('kk:mm:a').format(DateTime.now());
    return formatter;
  }

  todayDay() {
    var formatter = new DateFormat('EEEE').format(DateTime.now());
    return formatter;
  }

  simpan() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.blue,
      textColor: Colors.white,
      splashColor: Colors.yellowAccent[50],
      child: Text('Stop'),
      onPressed: () async {
        if (countMasker - countHistory <= 0)
          showMaterialDialog();
        else {
          history = History(todayTime(), todayDay(), todayDate());
          addHistory(history);
        }
      },
    );
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
    await dbHistory.initDb();
    int result = await dbHistory.insert(object);
    if (result > 0) {
      final controller = TabProvider.of(context).tabController;
      controller.index = 0;
    }
  }
}
