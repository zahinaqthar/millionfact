import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testtextflutter/services/reqapi.dart';

class FactDetails extends StatelessWidget {
  Artcicle artdetails;

  FactDetails({required this.artdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            artdetails.title,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          )),
      body: Column(children: <Widget>[
        Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(artdetails.urlToImage)),
            )),
        SizedBox(
          height: 8,
        ),
        Text(
          artdetails.content,
          style: TextStyle(fontSize: 12),
        )
      ]),
    );
  }
}
