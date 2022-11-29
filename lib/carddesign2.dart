import 'package:flutter/material.dart';
import 'dart:math';

class newCardDesign2 extends StatelessWidget {
  final String title, body, category;
  final bool ispressed;
  Function() iconTapped;
  final String? img;

  newCardDesign2(
      {required this.title,
      required this.body,
      required this.category,
      this.img,
      required this.ispressed,
      required this.iconTapped});

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
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          child: Image.network(
                            img ??
                                'https://www.shutterstock.com/image-photo/lonely-oak-tree-on-green-260nw-1093098482.jpg',
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.5,
                          MediaQuery.of(context).size.height * 0.25,
                          0,
                          20),
                      child: Row(children: <Widget>[
                        IconButton(
                            onPressed: iconTapped,
                            icon: Icon(
                              Icons.bookmark,
                              color: (ispressed == true)
                                  ? Colors.black
                                  : Colors.white,
                            )),
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
                        child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text: title,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)))
                        // Text(
                        //   title,
                        //   textAlign: TextAlign.left,
                        //   style: TextStyle(color: Colors.black, fontSize: 25),
                        // ),
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
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          20,
                          103 + MediaQuery.of(context).size.height * 0.25,
                          0,
                          20),
                      child: Text(
                        body,
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
