import 'package:flutter/material.dart';

import 'package:watermark/pages/home/components/topbanner.dart';
import 'package:watermark/pages/home/components/address.dart';
import 'package:watermark/pages/home/components/support.dart';
import 'package:watermark/pages/home/components/questions.dart';


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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: Header(),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    Support(),
                    Questions(),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 60.0),
                      child: Text('视频归平台及作者所有，本应用不储存任何视频或图片', style: TextStyle(color: Colors.black45)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}