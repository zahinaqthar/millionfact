import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testtextflutter/carddesign2.dart';
import 'package:testtextflutter/provider/cardprovider.dart';

class cardlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool onicon = false;
    var cardlist = context.watch<CardProvider>().cards;
    var mylist = context.watch<CardProvider>().mylist;
    return ListView.builder(
        itemCount: cardlist.length,
        itemBuilder: (_, index) {
          final currentCard = cardlist[index];
          return newCardDesign2(
            title: currentCard.title,
            body: currentCard.body,
            category: currentCard.category,
            ispressed: mylist.contains(currentCard) ? true : false,
            iconTapped: (mylist.contains(currentCard))
                ? () {
                    context.read<CardProvider>().removeFromList(currentCard);
                  }
                : () {
                    context.read<CardProvider>().addToList(currentCard);
                  },
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

class mylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _pressedlist = true;
    var _mylist = context.watch<CardProvider>().mylist;
    return ListView.builder(
        itemCount: _mylist.length,
        itemBuilder: (_, index) {
          final currentCard = _mylist[index];
          return newCardDesign2(
              title: currentCard.title,
              body: currentCard.body,
              category: currentCard.category,
              ispressed: _pressedlist,
              iconTapped: () {
                context.read<CardProvider>().removeFromList(currentCard);
                _pressedlist = !_pressedlist;
              });
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
