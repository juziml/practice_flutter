import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  //这个key到底什么东西，一会儿声明 一会儿 冒号的
  //required 代表必传吗
  ResultPage({Key key, @required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "接收参数，关闭时返回参数",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              //无状态的widget，内部函数无法使用context，所以只好写这里
              RaisedButton(onPressed:()=> Navigator.pop(context,"从ResultPage 返回来的"),
              child: Text("返回"),)
            ],
          ),
        ),
      ),
    );
  }
}
