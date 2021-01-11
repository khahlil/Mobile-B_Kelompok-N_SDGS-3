import 'package:e_Masker/pages/child/part/opening.dart';
import 'package:e_Masker/models/m_opening.dart';
import 'package:e_Masker/pages/home.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class OpeningPages extends StatefulWidget {
  @override
  _OpeningPagesState createState() => _OpeningPagesState();
}

class _OpeningPagesState extends State<OpeningPages> {
  List<OpeningModel> mySLides = new List<OpeningModel>();
  int slideIndex = 0;
  PageController controller;

  @override
  void initState() {
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: pageView(),
        ),
        bottomSheet: slideIndex != 2 ? scrollPage() : getStarted(context),
      ),
    );
  }

  PageView pageView() {
    return PageView(
      controller: controller,
      onPageChanged: (index) {
        setState(() {
          slideIndex = index;
        });
      },
      children: <Widget>[
        OpeningList(
          imagePath: mySLides[0].imageAssetPath,
          title: mySLides[0].title,
          desc: mySLides[0].desc,
        ),
        OpeningList(
          imagePath: mySLides[1].imageAssetPath,
          title: mySLides[1].title,
          desc: mySLides[1].desc,
        ),
        OpeningList(
          imagePath: mySLides[2].imageAssetPath,
          title: mySLides[2].title,
          desc: mySLides[2].desc,
        )
      ],
    );
  }

  InkWell getStarted(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushReplacement(new MaterialPageRoute(builder: (_) {
          return HomePages();
        }));
      },
      child: Container(
        height: Platform.isIOS ? 70 : 60,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "GET STARTED NOW",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }

  Container scrollPage() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          skipButton(),
          pageIndicator(),
          nextButton(),
        ],
      ),
    );
  }

  FlatButton skipButton() {
    return FlatButton(
      onPressed: () {
        controller.animateToPage(2,
            duration: Duration(milliseconds: 400), curve: Curves.linear);
      },
      splashColor: Colors.blue[50],
      child: Text(
        "SKIP",
        style: TextStyle(color: Color(0xFF0074E4), fontWeight: FontWeight.w600),
      ),
    );
  }

  Container pageIndicator() {
    return Container(
      child: Row(
        children: [
          for (int i = 0; i < 3; i++)
            i == slideIndex
                ? _buildPageIndicator(true)
                : _buildPageIndicator(false)
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.deepPurple[300] : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  FlatButton nextButton() {
    return FlatButton(
      onPressed: () {
        controller.animateToPage(slideIndex + 1,
            duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
      splashColor: Colors.blue[50],
      child: Text(
        "NEXT",
        style: TextStyle(color: Color(0xFF0074E4), fontWeight: FontWeight.w600),
      ),
    );
  }
}
