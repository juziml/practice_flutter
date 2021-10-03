import 'package:flutter/material.dart';
import 'package:flutter_first_app/noob_simple/CountHomePage.dart';
import 'package:flutter_first_app/noob_simple/SimpleHomePage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MainAppTitle",
      theme: ThemeData(
        primaryColor: Colors.amber,
            canvasColor: Colors.teal
      ),
      // home: SimpleHomePage(),
      home: CountHomePage("CountHomePage的名称",),
    );
  }

}

