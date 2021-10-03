import 'package:flutter/material.dart';
class SimpleHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("AppBar Name"),
      ),
      body: Text("Body"),
    );
  }
}
