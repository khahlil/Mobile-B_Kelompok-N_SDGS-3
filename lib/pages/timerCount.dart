import 'package:flutter/material.dart';

class TimerCount extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const TimerCount({
    Key key,
    this.fillColor,
    this.text,
    this.textColor = 0xFF000000,
    this.textSize = 24,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(3),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
          onPressed: () {
            callback(text);
          },
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}

class TimerCountPages extends StatefulWidget {
  @override
  _TimerCountPagesState createState() => _TimerCountPagesState();
}

class _TimerCountPagesState extends State<TimerCountPages> {
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void clear() {
    setState(() {
      _expression = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          judul(),
          SizedBox(height: 80.0),
          Container(
            child: Text(
              _expression,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TimerCount(
                text: '1',
                callback: numClick,
              ),
              TimerCount(
                text: '2',
                callback: numClick,
              ),
              TimerCount(
                text: '3',
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TimerCount(
                text: '4',
                callback: numClick,
              ),
              TimerCount(
                text: '5',
                callback: numClick,
              ),
              TimerCount(
                text: '6',
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TimerCount(
                text: '7',
                callback: numClick,
              ),
              TimerCount(
                text: '8',
                callback: numClick,
              ),
              TimerCount(
                text: '9',
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 60.0,
                child: MaterialButton(
                  onPressed: null,
                  child: SizedBox(),
                ),
              ),
              TimerCount(
                text: '0',
                callback: numClick,
              ),
              Container(
                width: 60.0,
                child: IconButton(
                  icon: Icon(Icons.backspace),
                  color: Colors.black,
                  onPressed: () {
                    clear();
                  },
                ),
              ),
            ],
          ),
          FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Text(
              'Simpan',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            color: Colors.blue,
            onPressed: () {},
          ),
          Container(
            height: 15,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  judul() {
    return Text(
      "Masukkan Total Masker",
      style: TextStyle(
        color: Colors.black,
        fontSize: 21.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
