import 'package:e_Masker/controls/tabcontroller.dart';
import 'package:e_Masker/controls/sharedPref.dart';
import 'package:e_Masker/controls/db_history.dart';
import 'package:e_Masker/models/m_history.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter/material.dart';

class HistoryPages extends StatefulWidget {
  final int total;
  final ValueChanged<int> changeTotal;
  final ValueChanged<int> changeHistory;

  const HistoryPages(
      {Key key, this.total, this.changeTotal, this.changeHistory})
      : super(key: key);

  @override
  HistoryPagesState createState() => HistoryPagesState();
}

class HistoryPagesState extends State<HistoryPages> {
  DbHistory dbHistory = DbHistory();
  List<History> historyList;
  int countHistory = 0;
  int countMasker = 0;
  String button = 'Masukkan Total Masker';

  @override
  Widget build(BuildContext context) {
    int total = TabProvider.of(context).total;
    countMasker = total;

    if (historyList == null) {
      historyList = List<History>();
      updateListHistory();
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 100.0),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(child: expandPanel()),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: countMasker == 0 ? null : bottomSheet(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 2.0,
        icon: Icon(Icons.add),
        label: countMasker != 0 ? Text('Mulai Timer') : Text(button),
        onPressed: () async {
          final controller = TabProvider.of(context).tabController;
          if ((countMasker - countHistory) <= 0 && countHistory >= 0) {
            showMaterialDialog();
          } else {
            switch (countMasker) {
              case 0:
                controller.index = 1;
                break;
              default:
                if (countMasker >= 1 && countHistory >= 0) controller.index = 2;
                break;
            }
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child:
                  Text("Reset", style: Theme.of(context).textTheme.subtitle2),
              onPressed: () {
                reset();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget expandPanel() {
    return ExpansionPanelList.radio(
      dividerColor: Colors.green,
      children: historyList.map<ExpansionPanelRadio>((History item) {
        return ExpansionPanelRadio(
          value: item.id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.hari + ' - ' + item.time,
                  style: Theme.of(context).textTheme.bodyText2),
            );
          },
          body: ListTile(
              title: Text('Tanggal : ' + item.date,
                  style: Theme.of(context).textTheme.bodyText2),
              subtitle: Text('Lama Pemakaian : ' + item.lap,
                  style: Theme.of(context).textTheme.bodyText1),
              trailing: Icon(Icons.delete),
              onTap: () {
                deleteHistory(item);
              }),
        );
      }).toList(),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 110,
      width: 720,
      decoration: sheetDecoration(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total masker   : ........................ ' +
                  countMasker.toString()),
              Text('Total terpakai : ........................ ' +
                  countHistory.toString()),
              Text('Sisa masker    : ........................ ' +
                  (countMasker - countHistory).toString()),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration sheetDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 10.0,
          spreadRadius: 0.4,
          offset: Offset.zero,
        )
      ],
      color: Colors.lightBlue[100],
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
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

  void deleteHistory(History object) async {
    int result = await dbHistory.delete(object.id);
    if (result > 0) {
      updateListHistory();
    }
  }

  void reset() async {
    await SharedPreferencesHelper.getInstance();
    SharedPreferencesHelper.putInt("totalMasker", 0);
    await dbHistory.dropDb();
    updateListHistory();
    countMasker = 0;
  }

  void updateListHistory() {
    Future<Database> dbFuture = dbHistory.initDb();
    dbFuture.then((database) {
      Future<List<History>> historyListFuture = dbHistory.getHistoryList();
      historyListFuture.then((historyList) {
        setState(() {
          this.historyList = historyList;
          this.countHistory = historyList.length;
          widget.changeHistory(countHistory);
        });
      });
    });
  }
}
