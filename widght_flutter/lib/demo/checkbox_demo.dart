import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxA = false;
  bool _checkboxB = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckboxDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    value: _checkboxA,
                    onChanged: (value) {
                      setState(() {
                        _checkboxA = value;
                      });
                    })
              ],
            ),
            CheckboxListTile(
              value: _checkboxB,
              onChanged: (value) {
                setState(() {
                  _checkboxB = value;
                });
              },
              title: Text('CheckboxListTile'),
              subtitle: Text('description'),
              selected: _checkboxB,
              secondary: Icon(Icons.bookmark),
            ),
          ],
        ),
      ),
    );
  }
}
