import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.all(20.0),
    height: 55.0,
    child: Form(
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12)
                ),
                hintText: '将视频连接粘贴在此处',
                hintStyle: TextStyle(color: Colors.black54, fontSize: 20.0),
                contentPadding: EdgeInsets.all(15.0),
              ),
              style: TextStyle(fontSize: 20.0),
            )
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Text('解析', style: TextStyle(fontSize: 18.0)),
              onPressed: (){},
              color: Colors.lightBlue[400],
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
