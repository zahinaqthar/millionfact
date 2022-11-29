import 'package:flutter/cupertino.dart';
import 'package:testtextflutter/carddesign2.dart';

List<newCardDesign2> cardinitList = List.generate(
    15,
    (index) => newCardDesign2(
          title: "Judul ${index}",
          body: "body",
          category: "Santai",
          ispressed: true,
          iconTapped: () {},
        ));

class CardProvider with ChangeNotifier {
  final List<newCardDesign2> _cards = cardinitList;
  List<newCardDesign2> get cards => _cards;

  final List<newCardDesign2> _mylist = [];
  List<newCardDesign2> get mylist => _mylist;

  void addToList(newCardDesign2 card) {
    _mylist.add(card);
    notifyListeners();
  }

  void removeFromList(newCardDesign2 card) {
    _mylist.remove(card);
    notifyListeners();
  }
}
