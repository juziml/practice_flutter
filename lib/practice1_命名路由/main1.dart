import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//这是app维度
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app名字", //
      theme: ThemeData(
        primarySwatch: Colors.pink, //主色调 粉色
        canvasColor: Colors.blueAccent,
      ),
      initialRoute: "/",//
      routes: {
       "/":(context){
          return HomePage();
        },
        "result_page":(context)=>ResultPage(text:"通过命名路由打开的"),
      },
    );
  }
}

//这是页的纬度
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("路由命名-练习"),
      ),
      body: Center(
          //必须给你整个正中间的样子
          child: Column(
        children: <Widget>[
          Text("配置路由命名，这是内置ARouter功能呀=="),
          RaisedButton(onPressed: ()=>{
           Navigator.pushNamed(context, "result_page").then((value){
             print("返回值 $value");
           })
          },
          child: Text("命名路由方式打开 result_page"),
          )
        ],
      )),
    );
  }
}



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
