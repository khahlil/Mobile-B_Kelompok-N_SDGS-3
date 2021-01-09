import 'package:e_Masker/models/m_history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryHistory extends StatefulWidget {
  final History history;

  EntryHistory(this.history);

  @override
  EntryHistoryState createState() => EntryHistoryState(this.history);
}

//class controller
class EntryHistoryState extends State<EntryHistory> {
  History history;

  EntryHistoryState(this.history);

  var now = new DateTime.now();

  TextEditingController hariController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (history != null) {
      hariController.text = history.hari;
      dateController.text = history.date;
      timeController.text = history.time;
    }
    //rubah
    return Scaffold(
      appBar: AppBar(
        title: history == null ? Text('Add') : Text('Edit'),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: hariController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Hari',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: dateController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Tanggal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: timeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Lama Pemakaian',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Save', textScaleFactor: 1.5),
                      onPressed: () {
                        if (history == null) {
                          history =
                              History(todayTime(), todayDay(), todayDate());
                        } else {
                          history.hari = hariController.text;
                          history.date = dateController.text;
                          history.time = timeController.text;
                        }
                        Navigator.pop(context, history);
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  // tombol batal
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Cancel', textScaleFactor: 1.5),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
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
}
