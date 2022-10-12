import 'package:flutter/material.dart';
import 'dart:math';

class newCardDesign extends StatelessWidget {
  const newCardDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: Colors.black,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Card(
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.black26,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                )
              ],
            ),
          ),
        ),
        Column(
          children: <Widget>[],
        )
      ],
    ));
  }
}
