import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    if (menuDataJson != null) {
      Menu menuData = Menu.fromJson(menuDataJson);
      setState(() {
        _menuItems = menuData.data;
      });
    }
  }

  List<Widget> getWidgetList() {
    return _menuItems.map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(Data item) => Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: CachedNetworkImage(
                imageUrl: "https://vip.svip8.vip${item.logo}",
                placeholder: (context, url) => CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
          ),
          SizedBox(height: 5),
          Text('${item.abbreviate}', style: TextStyle(fontSize: 10.0))
        ],
      )
  );

  Widget getSupports() {
    if (_menuItems == null) {
      return Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CupertinoActivityIndicator(),
          )
      );
    } else {
      return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 20.0,
          padding: EdgeInsets.all(10.0),
          crossAxisCount: 5,
          children: getWidgetList()
      );
    }
  }

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
        getSupports()
      ],
    ),
  );
}