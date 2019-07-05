import 'package:flutter/material.dart';

import 'package:watermark/pages/home/components/topbanner.dart';
import 'package:watermark/pages/home/components/address.dart';

class Header extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          TopBanner(),
          Address()
        ],
      ),
    );
  } // 头部展示内容

  @override
  double get maxExtent => 295.0; // 最大高度

  @override
  double get minExtent => 295.0; // 最小高度

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false; // 因为所有的内容都是固定的，所以不需要更新

}
