import 'package:e_Masker/controls/router.dart';
import 'package:e_Masker/pages/child/expansionPanel.dart';
import 'package:e_Masker/pages/home.dart';
import 'package:flutter/material.dart';

class SeeHistoryPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              ExpansionList(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomSheet,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 2.0,
        icon: const Icon(Icons.add),
        label: const Text('Masukkan Total Masker'),
        onPressed: () {},
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
                  value: "1",
                  child: Text("Hapus",
                      style: Theme.of(context).textTheme.subtitle2),
                ),
                DropdownMenuItem(
                  value: "2",
                  child: Text("Reset",
                      style: Theme.of(context).textTheme.subtitle2),
                ),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
