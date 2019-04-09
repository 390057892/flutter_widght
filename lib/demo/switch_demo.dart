import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchA = false;
  bool _switchB = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchDemo'),
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
                Text(
                  _switchA ? '😄' : '😭',
                  style: TextStyle(fontSize: 32.0),
                ),
                Switch(
                  value: _switchA,
                  onChanged: (value) {
                    setState(() {
                      _switchA = value;
                    });
                  },
                ),
              ],
            ),
            SwitchListTile(
              value: _switchB,
              onChanged: (value) {
                setState(() {
                  _switchB = value;
                });
              },
              title: Text('Switch item B'),
              subtitle: Text('Description'),
              secondary:Icon(_switchB ?Icons.visibility:Icons.visibility_off),
              selected: _switchB,
            )
          ],
        ),
      ),
    );
  }
}
