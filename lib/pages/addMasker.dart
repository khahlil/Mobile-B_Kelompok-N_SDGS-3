import 'package:flutter/material.dart';

class AddMasker extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const AddMasker({
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
      child: SizedBox(
        width: 65,
        height: 90,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(text, style: Theme.of(context).textTheme.subtitle1),
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

class AddMaskerPages extends StatefulWidget {
  @override
  _AddMaskerPagesState createState() => _AddMaskerPagesState();
}

class _AddMaskerPagesState extends State<AddMaskerPages> {
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
          SizedBox(height: 50.0),
          Container(
            child:
                Text(_expression, style: Theme.of(context).textTheme.subtitle1),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AddMasker(
                text: '1',
                callback: numClick,
              ),
              AddMasker(
                text: '2',
                callback: numClick,
              ),
              AddMasker(
                text: '3',
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AddMasker(
                text: '4',
                callback: numClick,
              ),
              AddMasker(
                text: '5',
                callback: numClick,
              ),
              AddMasker(
                text: '6',
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AddMasker(
                text: '7',
                callback: numClick,
              ),
              AddMasker(
                text: '8',
                callback: numClick,
              ),
              AddMasker(
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
              AddMasker(
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
          SizedBox(height: 40.0),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.blue,
              textColor: Colors.white,
              splashColor: Colors.yellowAccent[50],
              onPressed: () {},
              child: Text('Kembali')),
          Container(
            height: 20,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  judul() {
    return Text("Masukkan Total Masker",
        style: Theme.of(context).textTheme.bodyText2);
  }
}
