// import 'package:e_Masker/controls/style.dart';
// import 'package:e_Masker/pages/addMasker.dart';
// import 'package:e_Masker/pages/history.dart';
// import 'package:flutter/material.dart';

// class ParentPages extends StatefulWidget {
//   @override
//   _ParentPagesState createState() => _ParentPagesState();
// }

// class TabProvider extends InheritedWidget {
//   final TabController tabController;

//   TabProvider({this.tabController});

//   @override
//   bool updateShouldNotify(TabProvider oldWidget) {
//     return true;
//   }

//   static TabProvider of(BuildContext context) =>
//       context.dependOnInheritedWidgetOfExactType<TabProvider>();
// }

// class _ParentPagesState extends State<ParentPages>
//     with SingleTickerProviderStateMixin {
//   TabController _controller;

//   @override
//   void initState() {
//     _controller = TabController(
//       length: 3,
//       vsync: this,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "e-Masker",
//       theme: ThemeData(
//           appBarTheme:
//               AppBarTheme(textTheme: TextTheme(headline6: AppBarTextStyle)),
//           textTheme: TextTheme(
//             subtitle1: Title1TextStyle,
//             subtitle2: Title2TextStyle,
//             bodyText1: Body1TextStyle,
//             bodyText2: Body2TextStyle,
//           )),
//       home: Scaffold(
//         appBar: AppBar(
//           title: menu(),
//         ),
//         body: TabBarView(
//           controller: _tabController,
//           children: [HistoryPages(), AddMaskerPages(), AddMaskerPages()],
//         ),
//       ),
//     );
//   }

//   Widget menu() {
//     return Container(
//       child: TabBar(
//         controller: _tabController,
//         labelColor: Colors.white,
//         unselectedLabelColor: Colors.white70,
//         indicatorSize: TabBarIndicatorSize.tab,
//         indicatorPadding: EdgeInsets.all(5.0),
//         indicatorColor: Colors.blue,
//         tabs: [
//           Tab(
//             icon: Icon(Icons.assignment),
//           ),
//           Tab(
//             icon: Icon(Icons.edit),
//           ),
//           Tab(
//             icon: Icon(Icons.alarm),
//           )
//         ],
//       ),
//     );
//   }
// }
