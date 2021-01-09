import 'package:e_Masker/controls/tabcontroller.dart';
import 'package:flutter/material.dart';

class TimerPages extends StatefulWidget {
  const TimerPages({Key key}) : super(key: key);

  @override
  _TimerPagesState createState() => _TimerPagesState();
}

class _TimerPagesState extends State<TimerPages>
    with AutomaticKeepAliveClientMixin<TimerPages> {
  @override
  bool get wantKeepAlive => true;

  @protected
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        ),
      ),
    );
  }
}
