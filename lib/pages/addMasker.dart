import 'package:e_Masker/pages/child/part_addMasker.dart';
import 'package:e_Masker/controls/tabcontroller.dart';
import 'package:flutter/material.dart';

class AddMaskerPages extends StatefulWidget {
  final ValueChanged<int> changeTotal;
  const AddMaskerPages({Key key, this.changeTotal}) : super(key: key);

  @override
  _AddMaskerPagesState createState() => _AddMaskerPagesState();
}

class _AddMaskerPagesState extends State<AddMaskerPages> {
  String expression = '';

  void numClick(String text) {
    setState(() {
      expression += text;
    });
  }

  void clear() {
    setState(() {
      expression = '';
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
                Text(expression, style: Theme.of(context).textTheme.subtitle1),
          ),
          pemisah(),
          SizedBox(height: 20.0),
          tombol1(),
          tombol2(),
          tombol3(),
          bawah(),
          SizedBox(height: 40.0),
          simpan(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Text judul() {
    return Text("Masukkan Total Masker",
        style: Theme.of(context).textTheme.bodyText2);
  }

  Divider pemisah() {
    return Divider(color: Colors.grey, thickness: 1, indent: 20, endIndent: 20);
  }

  Row tombol1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AddMasker(text: '1', callback: numClick),
        AddMasker(text: '2', callback: numClick),
        AddMasker(text: '3', callback: numClick),
      ],
    );
  }

  Row tombol2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AddMasker(text: '4', callback: numClick),
        AddMasker(text: '5', callback: numClick),
        AddMasker(text: '6', callback: numClick),
      ],
    );
  }

  Row tombol3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AddMasker(text: '7', callback: numClick),
        AddMasker(text: '8', callback: numClick),
        AddMasker(text: '9', callback: numClick),
      ],
    );
  }

  Row bawah() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 60.0,
          child: MaterialButton(onPressed: null, child: SizedBox()),
        ),
        AddMasker(text: '0', callback: numClick),
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
    );
  }

  RaisedButton simpan() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.blue,
      textColor: Colors.white,
      splashColor: Colors.yellowAccent[50],
      child: Text('Simpan'),
      onPressed: () {
        if (expression == '0' || expression == '') {
          showMaterialDialog();
        } else {
          widget.changeTotal(int.parse(expression));
          final controller = TabProvider.of(context).tabController;
          controller.index = 0;
        }
      },
    );
  }

  showMaterialDialog() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text("Invalid input!"),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
