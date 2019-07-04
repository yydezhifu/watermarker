import 'package:flutter/material.dart';

class Questions extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(width: 1.0, color: Colors.black26)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Text('常见问题答疑', style: TextStyle(fontSize: 18.0))),
              Row(
                children: <Widget>[
                  Text('如何获取视频链接', style: TextStyle(color: Colors.cyan, fontSize: 16.0)),
                  SizedBox(width: 5.0),
                  Icon(Icons.help, size: 20.0, color: Colors.cyan)
                ],
              )
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Text('Q:',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  )
              ),
              SizedBox(width: 10.0),
              Text('提取视频下载失败？',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Text('A:',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  )
              ),
              SizedBox(width: 10.0),
              Expanded(
                  child: Text('请确认是否为图集，图集可以直接在浏览器中打开链接并长按保存。', softWrap: true))
            ],
          )
        ],
      )
  );

}
