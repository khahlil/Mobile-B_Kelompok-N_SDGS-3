import 'package:e_Masker/control/router.dart';
import 'package:e_Masker/model/m_list.dart';
import 'package:e_Masker/pages/child/part/cardlist.dart';
import 'package:e_Masker/pages/detail.dart';
import 'package:flutter/material.dart';

class ListPages extends StatefulWidget {
  @override
  _ListPagesState createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages> {
  List<ListModel> mySLides = new List<ListModel>();

  @override
  Widget build(BuildContext context) {
    mySLides = getList();

    return ListView.builder(
      itemCount: mySLides.length,
      itemBuilder: (context, int i) {
        return InkWell(
          splashColor: Colors.blueAccent,
          onTap: () {
            Router.changePages(
                context,
                DetailPages(
                    image: mySLides[i].image,
                    title: mySLides[i].title,
                    content: mySLides[i].content));
          },
          child: CardList(
            image: mySLides[i].image,
            title: mySLides[i].title,
            subtitle: mySLides[i].subtitle,
          ),
        );
      }
    );
  }
}