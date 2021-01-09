import 'package:e_Masker/controls/tabcontroller.dart';
import 'package:e_Masker/controls/db_history.dart';
import 'package:e_Masker/models/m_history.dart';
import 'package:e_Masker/controls/router.dart';
import 'package:e_Masker/pages/home.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter/material.dart';

class HistoryPages extends StatefulWidget {
  final int total;
  const HistoryPages({Key key, this.total}) : super(key: key);

  @override
  HistoryPagesState createState() => HistoryPagesState();
}

class HistoryPagesState extends State<HistoryPages> {
  // with AutomaticKeepAliveClientMixin<HistoryPages> {
  DbHistory dbHistory = DbHistory();
  List<History> historyList;
  int countHistory = 0;
  int countMasker = 0;
  String button = 'Masukkan Total Masker';

  // @override
  // bool get wantKeepAlive => true;
  // @protected
  @override
  Widget build(BuildContext context) {
    // super.build(context);

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
                  child: Container(child: buildPanel()),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: countMasker == null ? null : bottomSheet()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 2.0,
        icon: Icon(Icons.add),
        label: countMasker != null ? Text('Mulai Timer') : Text(button),
        onPressed: () async {
          final controller = TabProvider.of(context).tabController;
          if (countMasker == null) controller.index = 1;
          if ((countHistory - countMasker) <= 0)
            showMaterialDialog();
          else
            controller.index = 2;
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

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: 720,
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Text('Total masker : ' + countMasker.toString()),
            Text('Total terpakai : ' + countHistory.toString()),
            Text('Sisa masker : ' + (countMasker - countHistory).toString()),
          ],
        ),
      ),
    );
  }

  Widget buildPanel() {
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

  showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Masker sudah habis!"),
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
            ));
  }

  void deleteHistory(History object) async {
    int result = await dbHistory.delete(object.id);
    if (result > 0) {
      updateListHistory();
    }
  }

  void addHistory(History object) async {
    int result = await dbHistory.insert(object);
    if (result > 0) {
      updateListHistory();
    }
  }

  void reset() async {
    await dbHistory.dropDb();
    updateListHistory();
    countMasker = 0;
    Navigator.pop(context);
  }

  void updateListHistory() {
    Future<Database> dbFuture = dbHistory.initDb();
    dbFuture.then((database) {
      Future<List<History>> historyListFuture = dbHistory.getHistoryList();
      historyListFuture.then((historyList) {
        setState(() {
          this.historyList = historyList;
          this.countHistory = historyList.length;
        });
      });
    });
  }
}
