import 'package:e_Masker/controls/posting_provider.dart';
import 'package:e_Masker/controls/router.dart';
// import 'package:e_Masker/models/m_posting.dart';
import 'package:e_Masker/pages/child/part/cardlist.dart';
import 'package:e_Masker/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostingPages extends StatefulWidget {
  @override
  _PostingPagesState createState() => _PostingPagesState();
}

class _PostingPagesState extends State<PostingPages> {
  // final data = [
  //   PostingModel(
  //     title: "title",
  //     image: "assets/images/masker.jpg",
  //     subtitle: "subtitle.",
  //     content1: "content1",
  //     content2: "content2",
  //   ),
  //   PostingModel(
  //     title: "title",
  //     image: "assets/images/masker.jpg",
  //     subtitle: "subtitle.",
  //     content1: "content1",
  //     content2: "content2",
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostingProvider>(context, listen: false).getPosting(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Consumer<PostingProvider>(
          builder: (context, data, _) {
            return ListView.builder(
                itemCount: data.dataPosting.length,
                itemBuilder: (context, int i) {
                  return InkWell(
                    splashColor: Colors.blueAccent[200],
                    onTap: () {
                      Router.changePages(
                          context,
                          DetailPages(
                              image: data.dataPosting[i].image,
                              title: data.dataPosting[i].title,
                              content1: data.dataPosting[i].content1,
                              content2: data.dataPosting[i].content2));
                    },
                    child: CardList(
                      image: data.dataPosting[i].image,
                      title: data.dataPosting[i].title,
                      subtitle: data.dataPosting[i].subtitle,
                    ),
                  );
                });
          },
        );
      },
    );
  }
}
