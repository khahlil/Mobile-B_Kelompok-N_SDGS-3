import 'package:e_Masker/controls/db_history.dart';
import 'package:e_Masker/models/m_history.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:flutter/material.dart';

class ExpandHistory extends StatefulWidget {
  @override
  ExpandHistoryState createState() => ExpandHistoryState();
}

class ExpandHistoryState extends State<ExpandHistory> {
  DbHistory dbHistory = DbHistory();
  int count = 0;
  List<History> historyList;

  @override
  Widget build(BuildContext context) {
    if (historyList == null) {
      historyList = List<History>();
      updateListView();
    }

    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
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
                title: Text(item.time,
                    style: Theme.of(context).textTheme.bodyText2),
              );
            },
            body: ListTile(
                title: Text(item.date,
                    style: Theme.of(context).textTheme.bodyText2),
                subtitle: Text('To delete this panel, tap the trash can icon',
                    style: Theme.of(context).textTheme.bodyText1),
                trailing: Icon(Icons.delete),
                onTap: () {
                  deleteHistory(historyList[item.id]);
                }));
      }).toList(),
    );
  }

  //update contact
  void updateListView() {
    final Future<Database> dbFuture = dbHistory.initDb();
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

  //delete contact
  void deleteHistory(History object) async {
    int result = await dbHistory.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }
}
