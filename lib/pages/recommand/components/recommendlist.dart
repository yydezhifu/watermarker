import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:watermark/pages/recommand/components/webview.dart';
import 'package:watermark/pages/recommand/model/recommend_model.dart';
import 'package:watermark/api/api.dart';

class RecommendList extends StatefulWidget {
  @override
  _RecommendListState createState() => _RecommendListState();
}

class _RecommendListState extends State<RecommendList> {
  List<Data> _recommendItems;

  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  Future getNewsData() async {
    dynamic recommendJson = await TApi.getRecommendData();
    if (recommendJson != null) {
      Recommend recommendData = Recommend.fromJson(recommendJson);
      setState(() {
        _recommendItems = recommendData.data;
      });
    }
  }

  Widget buildListData(BuildContext context, Data recommend) => Card(
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => WebViewPage(url: '${recommend.url}', title: '${recommend.title}')
        ));
      },
      child: ListTile(
          leading: CircleAvatar(
            child: Container(
              child: CachedNetworkImage(
                imageUrl: recommend.ico,
                placeholder: (context, url) => CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          title: Text('${recommend.title}')
      ),
    )
  );

  Widget childWidget() {
    if (_recommendItems != null && _recommendItems.length != 0) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemExtent: 70.0,
          itemCount: _recommendItems.length,
          itemBuilder: (context, item) => buildListData(context, _recommendItems[item]),
        ),
      );
    } else {
      return Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 35.0),
            child: Center(
              child: SpinKitFadingCircle(
                color: Colors.blueAccent,
                size: 30.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.0),
            child: Center(
              child: Text('正在加载中，莫着急哦~'),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) => Container(
    child: childWidget(),
  );

}