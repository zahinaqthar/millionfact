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
            appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text(
                  "TechCrunch",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )),
            body: cardlist(),
          );
        }));
      },
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 10),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  card.initialData?.first.source.name ?? 'TechCrunch',
                  style: TextStyle(color: Colors.black54),
                )),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 25),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  'Sport',
                  style: TextStyle(color: Colors.black54),
                )),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 20),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  'Education',
                  style: TextStyle(color: Colors.black54),
                )),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 10),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  'Animal',
                  style: TextStyle(color: Colors.black54),
                )),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 25),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  'Science',
                  style: TextStyle(color: Colors.black54),
                )),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 20),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  'Football',
                  style: TextStyle(color: Colors.black54),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
