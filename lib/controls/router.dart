import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Router{
  static changePage(BuildContext context, StatefulWidget pages){
    Navigator.push(context, PageTransition(
        duration: Duration(milliseconds: 250),
        type: PageTransitionType.rightToLeftWithFade,
        child: pages
    ));
  }
  static changePages(BuildContext context, StatelessWidget pages){
    Navigator.push(context, PageTransition(
        duration: Duration(milliseconds: 250),
        type: PageTransitionType.rightToLeftWithFade,
        child: pages
    ));
  }
}