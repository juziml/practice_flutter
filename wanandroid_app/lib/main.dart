import 'package:flutter/material.dart';
import 'package:wanandroid_app/page/splash.dart';
import 'package:wanandroid_app/c/color_list.dart';

void main() {
  runApp(const WanAndroidAPP());
}

class WanAndroidAPP extends StatelessWidget {
  const WanAndroidAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: MColors.primaryColor,
          primaryColorDark: MColors.primaryColorDark,
          primaryColorLight: MColors.primaryColorLight),
      home: const SplashPage(),
    );
  }
}
