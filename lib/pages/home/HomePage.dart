import 'package:flutter/material.dart';

import 'package:watermark/pages/home/components/head.dart';
import 'package:watermark/pages/home/components/support.dart';
import 'package:watermark/pages/home/components/questions.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
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