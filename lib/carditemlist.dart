import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testtextflutter/carddesign2.dart';

class cardlist extends StatelessWidget {
  const cardlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        newCardDesign2(),
        newCardDesign2(),
        newCardDesign2(),
      ],
    );
  }
}
