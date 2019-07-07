import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:watermark/pages/SplashPage.dart';
import 'package:watermark/pages/IndexPage.dart';

void main() => runApp(WaterMarkApp());


class WaterMarkApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => OKToast(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.cyan
      ),
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => IndexPage()
      },
    ),
  );
}