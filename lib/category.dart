import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:testtextflutter/carditemlist.dart';
import 'package:testtextflutter/provider/cardprovider.dart';
import 'package:testtextflutter/services/reqapi.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = context.watch<CardProvider>().cards;
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => cardlist()));
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text("TechCrunch")),
            body: cardlist(),
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          card.initialData?.first.source.name ?? 'TechCrunch',
          style: TextStyle(color: Colors.black54),
        )),
      ),
    );
  }
}
