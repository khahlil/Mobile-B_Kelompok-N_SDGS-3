import 'package:flutter/material.dart';

class OpeningList extends StatelessWidget {
  final String imagePath, title, desc;

  OpeningList({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(height: 40),
          Text(title, style: Theme.of(context).textTheme.subtitle2),
          SizedBox(height: 20),
          Text(desc, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
