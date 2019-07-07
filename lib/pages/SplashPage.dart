import 'dart:async';
import 'package:flutter/material.dart';
import 'package:watermark/common/cache_manager.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;
    CacheManager.init().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: FractionalOffset.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150.0),
                child: Image.asset(
                  'images/gank.png',
                  width: 100,
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('${DateTime.now().year}@xsk.watermarker.io',
                  style: TextStyle(color: Colors.black, fontSize: 14.0, fontFamily: "WorkSansMedium")
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
