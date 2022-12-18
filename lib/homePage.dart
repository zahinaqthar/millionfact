import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtextflutter/carddesign2.dart';
import 'package:testtextflutter/carditemlist.dart';
import 'package:testtextflutter/category.dart';
import 'package:testtextflutter/login.dart';
import 'package:testtextflutter/provider/cardprovider.dart';
import 'package:testtextflutter/register.dart';
import 'package:testtextflutter/services/auth.dart';
import 'package:testtextflutter/services/global.dart';
import 'package:testtextflutter/settinglist.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    cardlist(),
    Category(),
    mylist(),
    settingList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getToken() async {
    String obtainedToken = await AuthServices.hasToken();
    if (obtainedToken == null) {
      errorSnackBar(context, "Cannot LogOut");
    }
    return obtainedToken;
  }

  loggOutPressed() async {
    String token = await getToken();
    http.Response response = await AuthServices.logout(token);
    if (response.statusCode == 200) {
      // errorSnackBar(context, responseMap['data'].toString());
      await AuthServices.unsetLocalToken();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyLogin()));
    } else {
      errorSnackBar(context, "Cannot LogOut");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image(image: AssetImage('assets/iconlogo.png')),
        title: Text(
          "Million Facts",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              loggOutPressed();
            },
            color: Colors.grey,
            icon: const Icon(Icons.logout),
            tooltip: "log out",
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
