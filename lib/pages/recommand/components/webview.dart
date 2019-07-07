import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage({this.url, this.title});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WebviewScaffold(
    appBar: AppBar(
      title: Text('${widget.title}', style: TextStyle(color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    url: widget.url,
    withLocalStorage: true,
    withJavascript: true,
  );

}