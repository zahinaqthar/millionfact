import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testtextflutter/carddesign2.dart';
import 'package:testtextflutter/cerddetail.dart';
import 'package:testtextflutter/services/getapi.dart';
import 'package:testtextflutter/services/reqapi.dart';
import 'package:provider/provider.dart';

ApiService _client = ApiService();

FutureBuilder<List<Artcicle>> articleinit = FutureBuilder(
    future: _client.getArticle(),
    builder: ((BuildContext context, AsyncSnapshot<List<Artcicle>> snapshot) {
      var mylist = context.watch<CardProvider>().mylist;
      if (snapshot.hasData) {
        List<Artcicle> articles = snapshot.data ?? <Artcicle>[];
        return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final currentArticle = articles[index];
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
                  img: currentArticle.urlToImage,
                  ispressed: mylist.contains(currentArticle) ? true : false,
                  iconTapped: (mylist.contains(currentArticle))
                      ? () {
                          context
                              .read<CardProvider>()
                              .removeFromList(currentArticle);
                        }
                      : () {
                          context
                              .read<CardProvider>()
                              .addToList(currentArticle);
                        },
                ),
              );
            });
      } else {
        return Text('no data');
      }
    }));

List<newCardDesign2> cardinitList = List.generate(
    15,
    (index) => newCardDesign2(
          title: "Judul ${index}",
          body: "body",
          category: "Santai",
          ispressed: true,
          iconTapped: () {},
          img:
              'http://wallup.net/wp-content/uploads/2015/12/235407-nature-landscape-gold-mountain-valley-mist-sunrise-Romania-lights-offing.jpg',
        ));

class CardProvider with ChangeNotifier {
  final FutureBuilder<List<Artcicle>> _cards = articleinit;
  FutureBuilder<List<Artcicle>> get cards => _cards;

  final List _mylist = [];
  List get mylist => _mylist;

  void addToList(Artcicle card) {
    _mylist.add(card);
    notifyListeners();
  }

  void removeFromList(Artcicle card) {
    _mylist.remove(card);
    notifyListeners();
  }
}
