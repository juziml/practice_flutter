import 'package:flutter/material.dart';
class GreenPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:Text("GreenPage")
      ),
      body: Center(
        child: Text("GreenPage body Center"),
      ),
    );
  }

}