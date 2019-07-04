import 'package:flutter/material.dart';

import 'package:watermark/pages/home/components/topbanner.dart';
import 'package:watermark/pages/home/components/address.dart';
import 'package:watermark/pages/home/components/support.dart';
import 'package:watermark/pages/home/components/questions.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TopBanner(),
                Address(),
                Support(),
                Questions()
              ],
            ),
          ),
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}