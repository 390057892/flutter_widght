import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;
  int _radioGroupB = 0;
  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

   void _handleRadioValueChangedB(int value) {
    setState(() {
      _radioGroupB = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text('_radioGroupB $_radioGroupB'),
            RadioListTile(
              value: 0,
              groupValue: _radioGroupB,
              onChanged: _handleRadioValueChangedB,
              title: Text('RadioListTile'),
              subtitle: Text('description'),
              secondary: Icon(Icons.bookmark),
              selected: _radioGroupB==0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioGroupB,
              onChanged: _handleRadioValueChangedB,
              title: Text('RadioListTile'),
              subtitle: Text('description'),
              secondary: Icon(Icons.bookmark),
              selected: _radioGroupB==1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioGroupA,
                  onChanged: _handleRadioValueChanged,
                ),
                 Radio(
                  value: 1,
                  groupValue: _radioGroupA,
                  onChanged: _handleRadioValueChanged,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
