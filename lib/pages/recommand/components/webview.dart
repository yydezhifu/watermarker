import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title, style: TextStyle(color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    body: Stack(
      children: <Widget>[
        WebView(
          initialUrl: widget.url,
          onWebViewCreated: (WebViewController web){},
          onPageFinished: (String value) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
        _loading()
      ],
    )
  );

  _loading() {
    return _isLoading == true ? Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ) : Text('');
  }
}