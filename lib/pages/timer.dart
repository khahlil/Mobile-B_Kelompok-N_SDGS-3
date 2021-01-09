import 'package:e_Masker/pages/tab.dart';
import 'package:flutter/material.dart';

class TimerPages extends StatefulWidget {
  const TimerPages({Key key}) : super(key: key);

  @override
  _TimerPagesState createState() => _TimerPagesState();
}

class _TimerPagesState extends State<TimerPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Container(
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
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.blue,
            textColor: Colors.white,
            splashColor: Colors.yellowAccent[50],
            child: Text('Simpan'),
            onPressed: () {
              final controller = TabProvider.of(context).tabController;
              controller.index = 0;
            },
          ),
        ),
      ),
    );
  }
}
