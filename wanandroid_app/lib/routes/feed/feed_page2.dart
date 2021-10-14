import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_app/color/color_list.dart';
import 'package:wanandroid_app/wiget/banner_widget.dart';
import 'package:wanandroid_app/model/banner_entity.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>_FeedPageState();

}

class _FeedPageState extends State<FeedPage>{
  List<BannerEntity> banners = [BannerEntity("http://tva1.sinaimg.cn/large/005Jb6GUgy1gvamn2yey2j609t05ggms02.jpg")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MColors.pageBackground,
        body:Container(
          color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    flex: 0,
                    child:  BannerWidget(banners)),
                Expanded(
                    flex: 1,
                    child: ListView.builder(
                    itemCount: 100,
                    itemExtent: 50,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text("$index"));
                    }))

              ],
            )));
  }
}

