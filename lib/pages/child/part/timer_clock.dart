import 'package:e_Masker/controls/timecontrol/clock_painter.dart';
import 'package:e_Masker/controls/timecontrol/timerProvider.dart';
import 'package:e_Masker/controls/timecontrol/curent_time.dart';
import 'package:flutter/material.dart';

class TimerClock extends StatefulWidget {
  final TimerProvider timerProvider;

  TimerClock(this.timerProvider, {Key key}) : super(key: key);

  TimerClockState createState() => TimerClockState();
}

class TimerClockState extends State<TimerClock> {
  CurrentTime currentTime;

  Paint paint;

  @override
  void initState() {
    paint = new Paint();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentTime = widget.timerProvider.msToTime(
        widget.timerProvider.stopwatch.elapsedMilliseconds);

    return CustomPaint(
      painter: ClockPainter(
          lineColor: Colors.lightBlueAccent,
          completeColor: Colors.blueAccent,
          hundreds: currentTime.hundreds,
          seconds: currentTime.seconds,
          minutes: currentTime.minutes,
          hours: currentTime.hours,
          width: 4.0,
          linePaint: paint),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentTime.hours.toString().padLeft(2, '0'),
              style: TextStyle(fontSize: 36.0),
            ),
            Text(
              '${currentTime.minutes.toString().padLeft(2, '0')} : ${currentTime.seconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 48.0),
            ),
            Text(
              currentTime.hundreds.toString().padLeft(2, '0'),
              style: TextStyle(fontSize: 24.0),
            )
          ],
        ),
      ),
    );
  }
}
