import 'package:flutter/material.dart';
import 'package:wanandroid_app/c/color_list.dart';

class HomePage extends StatefulWidget{

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
   return _HomeState();
  }

}

class _HomeState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(

      direction: Axis.vertical,
      children: [
        Expanded(
            flex: 1,
            child: Container(
            color: Colors.yellow,
        )),
        Expanded(
            flex: 0,
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon:Icon(Icons.house),
                    label: "AAA"
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.people),
                    label: "BBB"
                ),
                BottomNavigationBarItem(
                    icon:Icon(Icons.add),
                    label: "CCC"
                ),
              ],
            ))
      ],
      ),
    );
  }

}