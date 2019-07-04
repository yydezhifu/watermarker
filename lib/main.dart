import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:watermark/pages/home/HomePage.dart';
import 'package:watermark/pages/recommand/RecommendPage.dart';
import 'package:watermark/pages/mine/MinePage.dart';

void main() => runApp(WaterMarkApp());

class WaterMarkApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WaterMarkAppState();
}

class _WaterMarkAppState extends State<WaterMarkApp> {
  int _tabIndex = 0;

  List<BottomNavigationBarItem> _navigationViews;

  List<String> appBarTitles = <String>['首页', '推荐', '我的'];

  @override
  void initState() {
    super.initState();

    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: const Icon(Icons.home, size: 32.0), title: Text('首页')),
      BottomNavigationBarItem(icon: const Icon(Icons.subscriptions, size: 32.0), title: Text('推荐')),
      BottomNavigationBarItem(icon: const Icon(Icons.person, size: 32.0), title: Text('我的'))
    ];
  }

  final navigatorKey = GlobalKey<NavigatorState>();
  final SystemUiOverlayStyle _style =SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(_style);

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.cyan
      ),
      home: Scaffold(
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
      )
    );
  }
}
