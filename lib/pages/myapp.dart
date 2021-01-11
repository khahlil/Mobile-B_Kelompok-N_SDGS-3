import 'package:e_Masker/controls/posting_provider.dart';
import 'package:e_Masker/controls/style.dart';
import 'package:e_Masker/pages/welcome.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PostingProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "e-Masker",
        home: WelcomePages(),
        theme: themeStyle(),
      ),
    );
  }

  ThemeData themeStyle() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(headline6: AppBarTextStyle),
      ),
      textTheme: TextTheme(
        subtitle1: Title1TextStyle,
        subtitle2: Title2TextStyle,
        bodyText1: Body1TextStyle,
        bodyText2: Body2TextStyle,
      ),
    );
  }
}
