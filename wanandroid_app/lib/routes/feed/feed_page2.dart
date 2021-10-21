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

class _FeedPageStateDio extends State<FeedPage> {
  List<BannerEntity> banners = [
    BannerEntity(
        "http://tva1.sinaimg.cn/large/005Jb6GUgy1gvamn2yey2j609t05ggms02.jpg"),
    BannerEntity(
        "http://tva1.sinaimg.cn/large/005Jb6GUgy1gvnb1l8cnqj60d206h76302.jpg")
  ];

  List<FeedItem> feeds = [];
  int pageSize = 0;
  bool noMoreData = false;
  void _fetchData() async {
    if (pageSize > 1) {
      Future.delayed(const Duration(seconds: 2)).then((value) => {
        setState(() {
          noMoreData = true;
        })
      });
      return;
    }

    Response res = await HttpClient.getDio()
        .get(ServiceApiConstants.feeds + "$pageSize/json");
    print("res:${res.data}");
    BaseEntity root = BaseEntity.fromJson(res.data);
    print(
        "errorCode:${root.errorCode} errorMsg:${root.errorMsg} data:${root.data}");
    PageData feedPage = PageData.fromJson(root.data);
    print("feedPage:${feedPage.curPage}");
    List<FeedItem> datas = FeedItem.fromJsonList(feedPage.datas.cast());
    print("datas:${datas.length}");
    pageSize += 1;
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          setState(() {
            feeds.addAll(datas);
          })
        });
  }

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
                      itemCount: feeds.length+1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == feeds.length && !noMoreData) {
                          _fetchData();
                          return Container(
                            padding: const EdgeInsets.all((16.0)),
                            alignment: Alignment.center,
                            child: const SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child:
                                  CircularProgressIndicator(strokeWidth: 2.5),
                            ),
                          );
                        }else if(index == feeds.length){
                          return Container(
                            padding: const EdgeInsets.all((16.0)),
                            alignment: Alignment.center,
                            child:  Container(
                              alignment: Alignment.center,
                              child:Text("——再拉就过分了哈——"),
                            ),
                          );
                        }else {
                          return ListTile(title: Text(feeds[index].title));
                        }
                      },
                    ))
              ],
            )));
  }

  Widget _buildItems(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          feeds[index].title,
        ),
      ],
    );
  }
}
