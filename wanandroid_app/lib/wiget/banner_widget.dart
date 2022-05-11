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
      children: [_buildPageView(widget._images)],
    );
  }

  String calculate(int index, List<BannerEntity> images) {
    final imgIndex = index % (images.length);
    return images[imgIndex].imageUrl;
  }

  Widget _buildPageView(List<BannerEntity> images) {
    return Container(
      height: widget.height,
      child: PageView.builder(
          // onPageChanged: ,
          itemCount: 10000,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("点击图片"), duration: Duration(seconds: 2)));
              },
              child: Image.network(
                calculate(index, images),
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
