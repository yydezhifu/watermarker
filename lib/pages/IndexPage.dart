import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:watermark/pages/home/HomePage.dart';
import 'package:watermark/pages/recommand/RecommendPage.dart';
import 'package:watermark/pages/mine/MinePage.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _tabIndex = 0;

  List<BottomNavigationBarItem> _navigationViews;

  List<String> appBarTitles = <String>['首页', '推荐', '我的'];

  @override
  void initState() {
    super.initState();

    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: const Icon(Icons.home), title: Text('首页')),
      BottomNavigationBarItem(icon: const Icon(Icons.fiber_new), title: Text('推荐')),
      BottomNavigationBarItem(icon: const Icon(Icons.person), title: Text('我的'))
    ];

  }

  final SystemUiOverlayStyle _style =SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(_style);

    return Scaffold(
        body: IndexedStack(
          children: <Widget>[HomePage(), RecommendPage(), MinePage()],
          index: _tabIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _navigationViews.map((BottomNavigationBarItem navigationView) => navigationView).toList(),
          currentIndex: _tabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
    );
  }
}
