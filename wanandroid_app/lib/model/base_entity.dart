import 'dart:ffi';

class BaseEntity {
  final int errorCode;
  final String errorMsg;
  final Map<String, dynamic> data;

  const BaseEntity(
      {required this.errorMsg, required this.errorCode, required this.data});

  factory BaseEntity.fromJson(Map<String, dynamic> json) {
    return BaseEntity(
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String,
      data: json['data'] as Map<String, dynamic>,
    );
  }
}

class PageData {
  final int curPage;
  final int total;
  final List<dynamic> datas;

  const PageData({
    required this.curPage,
    required this.total,
    required this.datas,
  });

  factory PageData.fromJson(Map<String, dynamic> json) {
    return PageData(
      curPage: json['curPage'] as int,
      total: json['total'] as int,
      datas: json['datas'] as List<dynamic>,
    );
  }
}

class FeedItem {
  final String title;
  final int id;

  const FeedItem({
    required this.title,
    required this.id,
  });

  factory FeedItem.fromJson(Map<String, dynamic> json) {
    return FeedItem(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }

  static List<FeedItem> fromJsonList(List<Map<String, dynamic>> json) {
    List<FeedItem> datas = List.generate(json.length, (index) {
      return FeedItem.fromJson(json[index]);
    });
    return datas;
  }
}
