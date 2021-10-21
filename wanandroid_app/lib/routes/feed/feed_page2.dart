import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_app/color/color_list.dart';
import 'package:wanandroid_app/model/base_entity.dart';
import 'package:wanandroid_app/wiget/banner_widget.dart';
import 'package:wanandroid_app/model/banner_entity.dart';
import 'package:wanandroid_app/net/http.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FeedPageStateDio();
}

class _FeedPageState extends State<FeedPage> {
  List<BannerEntity> banners = [
    BannerEntity(
        "http://tva1.sinaimg.cn/large/005Jb6GUgy1gvamn2yey2j609t05ggms02.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MColors.pageBackground,
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(flex: 0, child: BannerWidget(banners)),
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

class _FeedPageStateDio extends State<FeedPage> {
  List<BannerEntity> banners = [
    BannerEntity(
        "http://tva1.sinaimg.cn/large/005Jb6GUgy1gvamn2yey2j609t05ggms02.jpg")
  ];
  List<FeedItem> feeds = [];
  int pageSize = 0;

  void _fetchData() async {
    if (pageSize > 0) {
      return;
    }
    pageSize+=1;
    Response res = await HttpClient.getDio().get(ServiceApiConstants.feeds);
    print("res:${res.data}");
    BaseEntity root = BaseEntity.fromJson(res.data);
    print(
        "errorCode:${root.errorCode} errorMsg:${root.errorMsg} data:${root.data}");
    PageData feedPage = PageData.fromJson(root.data);
    print("feedPage:${feedPage.curPage}");
    List<FeedItem> datas = FeedItem.fromJsonList(feedPage.datas.cast());
    print("datas:${datas.length}");
    setState(() {
      feeds = datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    _fetchData();
    return Scaffold(
        backgroundColor: MColors.pageBackground,
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(flex: 0, child: BannerWidget(banners)),
                Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: feeds.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text(feeds[index].title));
                      },
                    ))
              ],
            )));
  }
}
