import 'package:flutter/material.dart';

class DetailPages extends StatelessWidget {
  final String image, title, content1, content2;
  DetailPages({this.image, this.title, this.content1, this.content2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(title)),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
        children: [
          Card(
            elevation: 5.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(image, fit: BoxFit.cover)),
                Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 4.0),
                    child: Text(title,
                        style: Theme.of(context).textTheme.subtitle2)),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 4.0),
                  child: Column(
                    children: [
                      Text(content1,
                          style: Theme.of(context).textTheme.bodyText1),
                      SizedBox(height: 20),
                      Text(content2,
                          style: Theme.of(context).textTheme.bodyText1),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            splashColor: Colors.yellowAccent[50],
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Kembali'),
          )
        ],
      ),
    );
  }
}
