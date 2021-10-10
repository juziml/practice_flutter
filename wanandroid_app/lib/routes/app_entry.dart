import 'package:flutter/material.dart';
import 'package:wanandroid_app/routes/splash_page.dart';
import 'package:wanandroid_app/color/color_list.dart';

void main() {
  runApp(const WanAndroidAPP());
}

class WanAndroidAPP extends StatelessWidget {
  const WanAndroidAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.red,
          primaryColorDark: Colors.yellow,
          primaryColorLight: Colors.blue),
      home: const SplashPage(),
    );
  }
}
