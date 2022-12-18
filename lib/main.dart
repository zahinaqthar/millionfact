import 'package:flutter/material.dart';
import 'package:testtextflutter/homePage.dart';
import 'package:testtextflutter/login.dart';
import 'package:testtextflutter/provider/cardprovider.dart';
import 'package:testtextflutter/register.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<CardProvider>(
      create: (_) => CardProvider(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLogin(),
      routes: {
        'register': (context) => MyRegister(),
        'login': (context) => MyLogin(),
      },
    );
  }
}
