import 'package:flutter/material.dart';


class QA {
  String question;
  String answer;

  QA(this.question, this.answer);
}

class Questions extends StatelessWidget {

  List<QA> _qalist = <QA>[
    QA('提取视频下载失败?', '请确认是否为图集，图集可以直接在浏览器中打开链接并长按保存。'),
    QA('提示视频解析失败?', '请尝试在浏览器中打开视频链接，若浏览器无法打开则无法解析。'),
    QA('提取的视频还有水印?', '能解析99%以上视频，但若原作者上传的视频带有水印则无法去除。原视频是否有水印请查看对应app播放时是否有水印。'),
  ];

  List<Widget> getQAList() => _qalist.map((item) => getQAItem(item)).toList();

  Widget getQAItem(QA item) => Column(
      children: [
        SizedBox(height: 20.0),
        Row(
          children: <Widget>[
            Text('Q:',
                style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(width: 10.0),
            Text('${item.question}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)
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
                child: Text('${item.answer}', softWrap: true))
          ],
        ),
      ]
  );

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
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Column(
            children: getQAList(),
          )
        ],
      )
  );

}
