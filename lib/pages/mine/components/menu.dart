import 'package:flutter/material.dart';

class Menu {
  String image;
  String title;

  Menu(this.image, this.title);
}

class MenuWidget extends StatelessWidget {

  final List<Menu> _lists = <Menu>[
    Menu('images/note.png', '会员中心'),
    Menu('images/book.png', '邀请有礼'),
    Menu('images/calendar.png', '账号安全'),
    Menu('images/weather.png', '意见反馈'),
    Menu('images/clock.png', '设置')
  ];

  Widget getMenuItem(Menu item) => InkWell(
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('${item.image}'),
        radius: 15.0,
      ),
      title: Text('${item.title}', style: TextStyle(fontSize: 18.0)),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
    ),
  );

  List<Widget> getMenuList() {
    return _lists.map((item) => getMenuItem(item)).toList();
  }

  @override
  Widget build(BuildContext context) => Card(
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