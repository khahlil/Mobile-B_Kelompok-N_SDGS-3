import 'package:flutter/material.dart';

class DetailPages extends StatelessWidget {
  final String image, title, content;
  DetailPages({this.image, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 4.0),
              child: Image.asset(image, fit: BoxFit.cover)),
          Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 4.0),
              child: Text(title)),
          Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 4.0),
              // child: Text(content)),
              child: Column(
                children: [
                  Text(content),
                  Text(content),
                  Text(content),
                  Text(content),
                ],
              )),
        ]
      ),
    );
  }
}
