import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipBoardListener extends StatefulWidget {

  @override
  _ClipBoardListenerState createState() => _ClipBoardListenerState();
}

class _ClipBoardListenerState extends State<ClipBoardListener> {

  final clipboardContentStream = StreamController<String>.broadcast();

  Timer clipboardTriggerTime;

  @override
  void initState() {
    super.initState();
    addListener();
  }

  addListener () {
    clipboardTriggerTime = Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        Clipboard.getData(Clipboard.kTextPlain).then(
          (clipboardContent) => clipboardContentStream.add(clipboardContent.text)
        );
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
    clipboardContentStream.close();
    clipboardTriggerTime.cancel();
  }

  Stream get clipboardText => clipboardContentStream.stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: this.clipboardText,
      builder: (context, snapshot) {
        return Chip(
          label: Text('${snapshot.data}'),
        );
      },
    );
  }
}
