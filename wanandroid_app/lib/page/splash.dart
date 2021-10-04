// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wanandroid_app/c/color_list.dart';

class SplashPage extends StatelessWidget{
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primaryColorDark,
      body:ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: double.infinity
        ),
        child: Center(
          widthFactor: double.infinity,
          heightFactor: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              // Image.asset("images/icon_flutter.png",width: 100.0),
              Image(image: AssetImage("images/icon_flutter.png"),width: 80.0),
              Padding(padding: EdgeInsets.all(20)),
              const Text(
                "FlutterStuff",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                  fontSize: 40,
                ),),
            ],
          ),
        )

      ),

    );
  }

}