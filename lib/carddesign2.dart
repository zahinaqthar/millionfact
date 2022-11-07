import 'package:flutter/material.dart';
import 'dart:math';

class newCardDesign2 extends StatelessWidget {
  const newCardDesign2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Stack(
        children: <Widget>[
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.grey),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          color: Colors.white),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.5,
                          MediaQuery.of(context).size.height * 0.25,
                          0,
                          20),
                      child: Row(children: <Widget>[
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.bookmark)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.play_circle)),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          20,
                          50 + MediaQuery.of(context).size.height * 0.25,
                          0,
                          20),
                      child: Text(
                        "Title uuuuuuuu",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          20,
                          80 + MediaQuery.of(context).size.height * 0.25,
                          0,
                          20),
                      width: 110,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          20,
                          103 + MediaQuery.of(context).size.height * 0.25,
                          0,
                          20),
                      child: Text(
                        "Body Text",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
