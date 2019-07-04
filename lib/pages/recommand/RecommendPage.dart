import 'package:flutter/material.dart';
import 'package:watermark/pages/recommand/components/recommendlist.dart';

class RecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('推荐', style: TextStyle(color: Colors.white)),
    ),
    body: RecommendList()
  );
}
