import 'package:flutter/material.dart';
import 'package:wanandroid_app/model/banner_entity.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget(this._images, {Key? key, this.height = 200, this.onTap})
      : super(key: key);
  final List<BannerEntity> _images;
  final double height;
  final ValueChanged<BannerEntity>? onTap;

  @override
  State<StatefulWidget> createState() => _BannerState();
}

class _BannerState extends State<BannerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: _buildPageViews(),
    );
  }

  List<Widget> _buildPageViews() {
    List<Widget> widgets = [];
    for (var element in widget._images) {
      widgets.add(_buildPageView(element));
    }
    return widgets;
  }

  Widget _buildPageView(BannerEntity element) {
    return Container(
      height: widget.height,
      child: PageView.builder(
          // onPageChanged: ,
          itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("点击图片"), duration: Duration(seconds: 2)));
          },
          child: Image.network(
            element.imageUrl,
            fit: BoxFit.cover,
          ),
          // child: Container(
          //
          // ),
        );
      }),
    );
  }
}
