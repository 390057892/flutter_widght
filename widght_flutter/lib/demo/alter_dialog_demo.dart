import 'package:flutter/material.dart';
import 'dart:async';
class AlterDialogDemo extends StatefulWidget {
  @override
  _AlterDialogDemoState createState() => _AlterDialogDemoState();
}

class _AlterDialogDemoState extends State<AlterDialogDemo> {

_openAlterDialog (){
   showDialog(
    context:  context,
    barrierDismissible: false, //外部是否可以取消
    builder: (BuildContext context){
      return AlertDialog(
        title: Text('AlterDialog'),
        content: Text('Description'),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text('Sure'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      );
    }
   );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlterDialogDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Open AlterDialog'),
                  onPressed: _openAlterDialog,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
