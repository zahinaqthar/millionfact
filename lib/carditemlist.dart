import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testtextflutter/carddesign2.dart';
import 'package:testtextflutter/cerddetail.dart';
import 'package:testtextflutter/provider/cardprovider.dart';
import 'package:testtextflutter/services/getapi.dart';
import 'package:testtextflutter/services/reqapi.dart';

class cardlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiService client = ApiService();
    bool onicon = false;
    var mylist = context.watch<CardProvider>().mylist;
    var card = context.watch<CardProvider>().cards;
    return card;
    // FutureBuilder(
    //     future: client.getArticle(),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<List<Artcicle>> snapshot) {
    //       if (snapshot.hasData) {
    // List<Artcicle> articles = snapshot.data ?? <Artcicle>[];
    // ListView.builder(
    //     itemCount: card.initialData?.length,
    //     itemBuilder: (_, index) {
    //       final currentArticle = card.initialData![index];
    //       return newCardDesign2(
    //         title: currentArticle.title,
    //         body: currentArticle.description,
    //         category: currentArticle.source.name,
    //         img: currentArticle.urlToImage,
    //         ispressed: mylist.contains(currentArticle) ? true : false,
    //         iconTapped: (mylist.contains(currentArticle))
    //             ? () {
    //                 context
    //                     .read<CardProvider>()
    //                     .removeFromList(currentArticle);
    //               }
    //             : () {
    //                 context.read<CardProvider>().addToList(currentArticle);
    //               },
    //       );
    //     });

    // ListView(
    //   children: <Widget>[
    //     newCardDesign2(
    //       title: "Judul Pertama",
    //       body: "Ini body",
    //       category: "Category",
    //       img: "gbr img",
    //     )
    //   ],
    // );
  }
}

class mylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _pressedlist = true;
    var _mylist = context.watch<CardProvider>().mylist;
    return ListView.builder(
        itemCount: _mylist.length,
        itemBuilder: (_, index) {
          final currentArticle = _mylist[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FactDetails(artdetails: currentArticle)));
            },
            child: newCardDesign2(
                title: currentArticle.title,
                body: currentArticle.description,
                category: currentArticle.source.name,
                ispressed: _pressedlist,
                img: currentArticle.urlToImage,
                iconTapped: () {
                  context.read<CardProvider>().removeFromList(currentArticle);
                }),
          );
        });
    // ListView(
    //   children: <Widget>[
    //     newCardDesign2(
    //       title: "Judul Pertama",
    //       body: "Ini body",
    //       category: "Category",
    //       img: "gbr img",
    //     )
    //   ],
    // );
  }
}
