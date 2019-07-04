import 'package:flutter/material.dart';
import 'package:watermark/pages/home/model/menu_model.dart';
import 'package:watermark/api/api.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  List<Data> _menuItems;

  @override
  void initState() {
    super.initState();
    getMenuData();
  }

  Future getMenuData() async {
    dynamic menuDataJson = await TApi.getMenuData();
    Menu menuData = Menu.fromJson(menuDataJson);
    setState(() {
      _menuItems = menuData.data;
    });
  }

  List<Widget> getWidgetList() {
    return _menuItems == null ? [] : _menuItems.map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(Data item) => Container(
      child: Column(
        children: <Widget>[
          Expanded(child:
            Image.network("https://vip.svip8.vip"+item.logo, fit: BoxFit.fill)
          ),
          SizedBox(height: 5),
          Text('${item.abbreviate}', style: TextStyle(fontSize: 10.0))
        ],
      )
  );

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
    margin: EdgeInsets.symmetric(horizontal: 20.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(width: 1.0, color: Colors.black26)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('支持平台', style: TextStyle( color: Colors.black, fontSize: 20.0 )),
        SizedBox(height: 5.0),
        GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 20.0,
            padding: EdgeInsets.all(10.0),
            crossAxisCount: 5,
            children: getWidgetList()
        )
      ],
    ),
  );
}