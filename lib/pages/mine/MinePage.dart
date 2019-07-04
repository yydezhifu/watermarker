import 'package:flutter/material.dart';

import 'package:watermark/pages/mine/components/head.dart';
import 'package:watermark/pages/mine/components/menu.dart';


class MinePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      decoration: BoxDecoration(
        color: Colors.grey
      ),
      child: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16/9,
            child: Container(
              decoration: BoxDecoration( color: Colors.cyan )
            ),
          ),
          Positioned(
            top: 120.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: <Widget>[
                UserWidget(),
                SizedBox(height: 15.0),
                MenuWidget()
              ],
            ),
          )
        ],
      ),
    ),
  );

}
