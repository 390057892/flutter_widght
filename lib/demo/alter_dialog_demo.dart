import 'package:flutter/material.dart';

enum Action { Ok, Cancel }

class AlterDialogDemo extends StatefulWidget {
  @override
  _AlterDialogDemoState createState() => _AlterDialogDemoState();
}

class _AlterDialogDemoState extends State<AlterDialogDemo> {
  String _choice = 'nothing';
  _openAlterDialog() async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false, //外部是否可以取消
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlterDialog'),
            content: Text('Description'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, Action.Cancel);
                },
              ),
              FlatButton(
                child: Text('Sure'),
                onPressed: () {
                  Navigator.pop(context, Action.Ok);
                },
              ),
            ],
          );
        });

    switch (action) {
      case Action.Cancel:
        setState(() {
          _choice = 'Cancel';
        });
        break;
      case Action.Ok:
        setState(() {
          _choice = 'Sure';
        });
        break;
      default:
    }
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
            Text('你点击了$_choice'),
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
