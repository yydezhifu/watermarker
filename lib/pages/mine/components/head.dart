import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.topCenter,
    overflow: Overflow.visible,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 5.0
              ),
            ]
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('13552579258', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                  SizedBox(width: 10.0),
                  Image.asset('images/vip.png', width: 20.0)
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('5', style: TextStyle(fontSize: 25.0, color: Colors.cyan, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5.0),
                        Text('今日剩余解析次数')
                      ],
                    ),
                  ),
                  Container(
                      height: 50,
                      child: VerticalDivider(color: Colors.black54)
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('开通VIP会员', style: TextStyle(fontSize: 20.0, color: Colors.cyan, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5.0),
                        Text('专享无限解析次数')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Positioned(
        top: -20.0,
        child: CircleAvatar(
          backgroundImage: AssetImage("images/head.png"),
          radius: 35.0,
        ),
      )
    ],
  );
}