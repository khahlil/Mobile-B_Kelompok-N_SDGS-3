import 'package:e_Masker/controls/style.dart';
import 'package:e_Masker/pages/openingscreen.dart';
import 'package:e_Masker/controls/posting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PostingProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "e-Masker",
        home: OpeningPages(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(headline6: AppBarTextStyle),
          ),
          textTheme: TextTheme(
            subtitle1: Title1TextStyle,
            subtitle2: Title2TextStyle,
            bodyText1: Body1TextStyle,
            bodyText2: Body2TextStyle,
          ),
        ),
      ),
    );
  }
}
