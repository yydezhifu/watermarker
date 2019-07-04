import 'package:flutter/material.dart';
import 'package:watermark/pages/home/HomePage.dart';
import 'package:watermark/pages/MinePage.dart';

void main() => runApp(WaterMarkApp());

class WaterMarkApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WaterMarkAppState();
}

class _WaterMarkAppState extends State<WaterMarkApp> {
  int _tabIndex = 0;

  List<BottomNavigationBarItem> _navigationViews;

  List<String> appBarTitles = <String>['首页', '我的'];

  @override
  void initState() {
    super.initState();

    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: const Icon(Icons.home), title: Text('首页')),
      BottomNavigationBarItem(icon: const Icon(Icons.person), title: Text('我的'))
    ];
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          children: <Widget>[HomePage(), MinePage()],
          index: _tabIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _navigationViews
              .map((BottomNavigationBarItem navigationView) => navigationView)
              .toList(),
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
