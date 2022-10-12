import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  String textmsg = "ini sebuah text";
  Random random = Random();
  int count = 1;

  void pencetTombol() {
    setState(() {
      textmsg = "Tombol sudah ditekan";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
              child: Text(
            "Anonymous Method",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          )),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              color: Colors.grey,
              icon: const Icon(Icons.add_alert),
              tooltip: "show SnackBar",
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  textmsg = "Silakan Tekan Tombol Di bawah";
                  count = 1;
                });
              },
              color: Colors.grey,
              icon: const Icon(Icons.refresh),
              tooltip: "Refresh",
            ),
            IconButton(
              onPressed: () {},
              color: Colors.grey,
              icon: const Icon(Icons.close),
              tooltip: "close",
            ),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(textmsg),
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    textmsg = "Tombol sudah ditekan $count kali";
                    count++;
                  });
                }),
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: AnimatedContainer(
                color: Color.fromARGB(255, random.nextInt(256),
                    random.nextInt(256), random.nextInt(256)),
                duration: Duration(seconds: 1),
                width: random.nextInt(101) + 50,
                height: random.nextInt(101) + 50,
              ),
            ),
          ],
        )),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.home),
                tooltip: "home button",
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.category),
                tooltip: "category button",
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.bookmark),
                tooltip: "bookmarks button",
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.settings),
                tooltip: "setting button",
              )
            ],
          ),
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
