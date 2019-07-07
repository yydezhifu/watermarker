import 'package:flutter/material.dart';
import 'package:watermark/pages/mine/model/item_model.dart';

class MenuWidget extends StatelessWidget {

  final List<Item> _lists = <Item>[
    Item('images/note.png', '会员中心'),
    Item('images/book.png', '邀请有礼'),
    Item('images/calendar.png', '账号安全'),
    Item('images/weather.png', '意见反馈'),
    Item('images/clock.png', '设置')
  ];

  Widget getMenuItem(Item item) => InkWell(
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('${item.image}'),
        radius: 15.0,
      ),
      dense: true,
      title: Text('${item.title}', style: TextStyle(fontSize: 16.0)),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
    ),
  );

  List<Widget> getMenuList() {
    return _lists.map((item) => getMenuItem(item)).toList();
  }

  @override
  Widget build(BuildContext context) => Container(
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
    child: ListView(
      padding: EdgeInsets.only(top: 0.0),
      shrinkWrap: true,
      children:  ListTile.divideTiles(
          context: context,
          tiles: getMenuList()
      ).toList(),
    ),
  );
}