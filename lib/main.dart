import 'package:flutter/material.dart';
import 'package:flutter_first_app/ResultPage.dart';
import 'GreenPage.dart';

/*void main() {
  runApp(MyApp());
}*/
//单行函数的简写，说不喜欢呢

void main() => runApp(MyApp());

//Stateless 无状态
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //MaterialApp 内有非常多的属性，比如黑暗模式
    return MaterialApp(
      title: '应用名称',
      //设置主题
      theme: ThemeData(
        //主题色,这个api倒是挺有意思,给了很多调好的颜色
        primarySwatch: Colors.pink,
        // primarySwatch: Colors.pink[400],//类型不对不能用呢
      ),
      //应用页面路由：这个概念暂时还不是很明确
      home: MyHomePage(appBarName: 'appBar的标题'),
    );
  }
}

//Stateful 这个还记得，代表是有状态
class MyHomePage extends StatefulWidget {
  //这里的key是个什么玩意,有点像widget id的意思
  MyHomePage({Key key, this.title, this.appBarName}) : super(key: key);
  final String title;
  final String appBarName;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//作为MyHomePage的状态管理类
class _MyHomePageState extends State<MyHomePage> {
  //一个变量，记得_开头为私有
  int _counter = 0;
  String resultStr = "等待返回值...";
//私有函数，对counter进行自增
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _goToNewPage() {
    var d = Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return GreenPage();
          },
          settings: RouteSettings(name: "RouteSettings", arguments: 1),
          fullscreenDialog: true,
        ));
    print(d.toString());
  }
  Future<void> _goToResultPage()  {
    var result =  Navigator.push(context, MaterialPageRoute(builder: (context){
      return ResultPage(text:"从主页来的");
    }));
    result.then((value) => {
      setState((){
        resultStr = value ==null?"点左上角返回的，没有值":value;
        //虽然可以写成 value?xx:xx ,但是这里value是dynamic的，所以能写不能用
      })
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarName),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "我的文本",
            ),
            FloatingActionButton(
              onPressed: _goToNewPage,
              tooltip: 'openNewPage',
              child: Icon(Icons.double_arrow_outlined),
            ),
            RaisedButton(
              onPressed: _goToResultPage,
              child: Text("打开ResultPage 并传值"),
            ),
            Text(resultStr)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
