import 'package:flutter/material.dart';

class CountHomePage extends StatefulWidget {
  final String name;

  CountHomePage(this.name, {Key key}) : super(key: key);

  //下面这样写在{}里面，在填值时就需要 制定 属性名称
  // CountHomePage( {Key key,this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CountHomePageState();
  }
}

class _CountHomePageState extends State<CountHomePage> {

  int _counter = 0;

  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text("点击下方的按钮 增加计数"),
            Text('$_counter',
              style: TextStyle(
                fontSize: 99,
                color: Colors.white
              ),
            ),
            FloatingActionButton(onPressed: _incrementCount,
              child:  Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
