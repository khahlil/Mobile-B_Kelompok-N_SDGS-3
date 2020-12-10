import 'package:e_Masker/model/m_timerhistory.dart';
import 'package:flutter/material.dart';

class ExpansionList extends StatefulWidget {
  @override
  ExpansionListState createState() => ExpansionListState();
}

class ExpansionListState extends State<ExpansionList> {
  List<TimerHistory> _data = generateItems(4);

  @override
  Widget build(BuildContext context) {
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
      children: _data.map<ExpansionPanelRadio>((TimerHistory item) {
        return ExpansionPanelRadio(
            value: item.id,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue,
                    style: Theme.of(context).textTheme.bodyText2),
              );
            },
            body: ListTile(
                title: Text(item.expandedValue,
                    style: Theme.of(context).textTheme.bodyText2),
                subtitle: Text('To delete this panel, tap the trash can icon',
                    style: Theme.of(context).textTheme.bodyText1),
                trailing: Icon(Icons.delete),
                onTap: () {
                  setState(() {
                    _data.removeWhere((currentItem) => item == currentItem);
                  });
                }));
      }).toList(),
    );
  }
}
