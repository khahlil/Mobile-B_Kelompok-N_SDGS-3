import 'package:e_Masker/control/router.dart';
import 'package:e_Masker/pages/home.dart';
import 'package:flutter/material.dart';

class TimerHistoryPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exstensionPane = Container(child: Text('awdw'));

    final bottomSheet = Container(
      height: 200,
      width: 720,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Text('total masker'),
    );

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            // padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              exstensionPane,
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomSheet,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
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
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
