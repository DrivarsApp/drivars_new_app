import 'package:gogame/constants/API.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwipeImageWithIndicator extends StatelessWidget with BaseCommonWidget {
  final ScrollPhysics scrollPhysics;
  final bool outer;
  final String imageUrl;
  final double height;
  final Color inActiveColor;
  final Color activeColor;
  final double inActiveSize;
  final double activeSize;
  final int itemCount;
  IndexedWidgetBuilder itemBuilder;

  SwipeImageWithIndicator({
    this.scrollPhysics,
    this.outer = false,
    this.imageUrl,
    this.height,
    this.inActiveColor,
    this.activeColor,
    this.inActiveSize = 5,
    this.activeSize = 6,
    this.itemCount,
    this.itemBuilder
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: Swiper(
        physics: scrollPhysics,
        outer: false,
        itemBuilder: itemBuilder,  /*(context, int) {
          return Wrap(runSpacing: 6.0, children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  child: Container(
                    child: loadBannerImage(API.domain + imageUrl, height),
                  ),
                ),
              ],
            )
          ]);
        },*/
        pagination: SwiperPagination(
          margin: EdgeInsets.all(5.0),
          builder: DotSwiperPaginationBuilder(
              color: inActiveColor,
              activeColor: activeColor,
              size: inActiveSize,
              activeSize: activeSize),
        ),
        itemCount: itemCount,
      ),
      constraints: BoxConstraints.loose(
        Size(double.infinity, height),
      ),
    );
  }
}
