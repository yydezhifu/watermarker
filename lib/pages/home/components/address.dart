import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
    height: 50.0,
    child: Form(
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '将视频链接粘贴在此处',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12)
                ),
              ),
              style: TextStyle(fontSize: 18.0),
            )
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Text('解析', style: TextStyle(fontSize: 18.0)),
              onPressed: (){},
              color: Colors.cyan,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            )
          )
        ],
      ),
    ),
  );
}
