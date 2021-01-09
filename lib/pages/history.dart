import 'package:e_Masker/controls/tabcontroller.dart';
import 'package:e_Masker/controls/db_history.dart';
import 'package:e_Masker/models/m_history.dart';
import 'package:e_Masker/controls/router.dart';
import 'package:e_Masker/pages/home.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter/material.dart';

class HistoryPages extends StatefulWidget {
  const HistoryPages({Key key}) : super(key: key);

  @override
  HistoryPagesState createState() => HistoryPagesState();
}

class HistoryPagesState extends State<HistoryPages> {
  DbHistory dbHistory = DbHistory();
  List<History> historyList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (historyList == null) {
      historyList = List<History>();
      updateListView();
    }

    final bottomSheet = Container(
      height: 200,
      width: 720,
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Center(child: Text('total masker')),
    );

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            children: <Widget>[
              SingleChildScrollView(
                child: Container(child: _buildPanel()),
              ),
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomSheet),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 2.0,
        icon: Icon(Icons.add),
        label: count == 0 ? Text('Masukkan Total Masker') : Text('Mulai Timer'),
        onPressed: () async {
          final controller = TabProvider.of(context).tabController;
          count == 0 ? controller.index = 1 : controller.index = 2;
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
                Router.changePage(context, HomePages());
              },
            ),
            DropdownButton<String>(
              icon: Icon(Icons.more_vert),
              items: [
                DropdownMenuItem(
                  value: '',
                  child: Text("Reset",
                      style: Theme.of(context).textTheme.subtitle2),
                  onTap: () {
                    reset();
                  },
                ),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      dividerColor: Colors.green,
      initialOpenPanelValue: 0,
      children: historyList.map<ExpansionPanelRadio>((History item) {
        return ExpansionPanelRadio(
          value: item.id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text('Hari ' + item.hari,
                  style: Theme.of(context).textTheme.bodyText2),
            );
          },
          body: ListTile(
              title: Text('Tanggal : ' + item.date,
                  style: Theme.of(context).textTheme.bodyText2),
              subtitle: Text('Lama Pemakaian : ' + item.time,
                  style: Theme.of(context).textTheme.bodyText1),
              trailing: Icon(Icons.delete),
              onTap: () {
                deleteHistory(item);
              }),
        );
      }).toList(),
    );
  }

  void deleteHistory(History object) async {
    int result = await dbHistory.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void reset() async {
    await dbHistory.dropDb();
    updateListView();
    count = 0;
  }

  void updateListView() {
    Future<Database> dbFuture = dbHistory.initDb();
    dbFuture.then((database) {
      Future<List<History>> historyListFuture = dbHistory.getHistoryList();
      historyListFuture.then((historyList) {
        setState(() {
          this.historyList = historyList;
          this.count = historyList.length;
        });
      });
    });
  }
}
