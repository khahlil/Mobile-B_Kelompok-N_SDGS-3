import 'package:flutter/material.dart';

class DetailPages extends StatelessWidget {
  final String image, title, content1, content2;
  DetailPages({this.image, this.title, this.content1, this.content2});

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
              child: Text(title, style: Theme.of(context).textTheme.subtitle1)),
          Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 4.0),
              child: Column(
                children: [
                  Text(content1, style: Theme.of(context).textTheme.bodyText2),
                  Text(content2, style: Theme.of(context).textTheme.bodyText2),
                ],
              )),
        ]
      ),
    );
  }
}
