import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BannerState();
  }
}

class _BannerState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.yellow,
    width: 300,
    height: 300,
    );
  }
}
