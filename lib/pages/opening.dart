import 'dart:io';
import 'package:e_Masker/controll/m_opening.dart';
import 'package:e_Masker/controll/router.dart';
import 'package:e_Masker/pages/login.dart';
import 'package:flutter/material.dart';

class OpeningPages extends StatefulWidget {
  @override
  _OpeningPagesState createState() => _OpeningPagesState();
}

class _OpeningPagesState extends State<OpeningPages> {

  List<OpeningModel> mySLides = new List<OpeningModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
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
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView(
            controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
          children: <Widget>[
            SlideOpening(
              imagePath: mySLides[0].getImageAssetPath(),
              title: mySLides[0].getTitle(),
              desc: mySLides[0].getDesc(),
            ),
            SlideOpening(
              imagePath: mySLides[1].getImageAssetPath(),
              title: mySLides[1].getTitle(),
              desc: mySLides[1].getDesc(),
            ),
            SlideOpening(
              imagePath: mySLides[2].getImageAssetPath(),
              title: mySLides[2].getTitle(),
              desc: mySLides[2].getDesc(),
            )
          ],
          ),
        ),
        bottomSheet: slideIndex != 2 ? Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                splashColor: Colors.blue[50],
                child: Text(
                  "SKIP",
                  style: TextStyle(color: Color(0xFF0074E4), fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                  ],),
              ),
              FlatButton(
                onPressed: (){
                  // print("this is slideIndex: $slideIndex");
                  controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
                },
                splashColor: Colors.blue[50],
                child: Text(
                  "NEXT",
                  style: TextStyle(color: Color(0xFF0074E4), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ): InkWell(
          onTap: (){
            Router.changePage(context, LoginPages());
          },
          child: Container(
            height: Platform.isIOS ? 70 : 60,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "GET STARTED NOW",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SlideOpening extends StatelessWidget {
  String imagePath, title, desc;

  SlideOpening({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox( height: 40),
          Text(
            title, 
            textAlign: TextAlign.center,
            style: TextStyle( fontWeight: FontWeight.w500, fontSize: 20),
            ),
          SizedBox( height: 20),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle( fontWeight: FontWeight.w500, fontSize: 14)
            )
        ],
      ),
    );
  }
}

