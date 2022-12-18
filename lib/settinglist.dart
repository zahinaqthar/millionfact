import 'package:flutter/material.dart';

class settingList extends StatelessWidget {
  const settingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Card buildCard(IconData iconname, String desc) {
      return Card(
        elevation: 5,
        child: Row(children: [
          Container(
              margin: EdgeInsets.all(5),
              child: Icon(
                iconname,
                color: Colors.green,
              )),
          Text(desc),
        ]),
      );
    }

    return ListView(
      children: [
        buildCard(Icons.density_medium_outlined, "Preferences"),
        buildCard(Icons.brightness_6, "Dark Mode"),
        buildCard(Icons.add_alarm, "Alarm add"),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            "Follow Us",
            style: TextStyle(fontSize: 20),
          ),
        ),
        buildCard(Icons.facebook, "Facebook"),
      ],
    );
  }
}
