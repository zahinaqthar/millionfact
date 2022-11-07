import 'package:flutter/material.dart';
import 'package:testtextflutter/carddesign2.dart';
import 'package:testtextflutter/carditemlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    cardlist(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Million Facts",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              color: Colors.grey,
              icon: const Icon(Icons.add_alert),
              tooltip: "show SnackBar",
            ),
            IconButton(
              onPressed: () {},
              color: Colors.grey,
              icon: const Icon(Icons.refresh),
              tooltip: "Refresh",
            ),
            IconButton(
              onPressed: () {},
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                child: Text(
                  "Ini Header",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: const Text("Item 1"),
                leading: Icon(Icons.alarm),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Item 2"),
                leading: Icon(Icons.message),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Item 3"),
                leading: Icon(Icons.email),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Item 4"),
                leading: Icon(Icons.phone),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Item 5"),
                leading: Icon(Icons.camera),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Item 6"),
                leading: Icon(Icons.watch),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Item 7"),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
