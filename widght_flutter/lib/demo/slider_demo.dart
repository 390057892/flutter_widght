import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _slideItemA = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
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
                Slider(
                  value: _slideItemA,
                  onChanged: (value) {
                    setState(() {
                      _slideItemA = value;
                    });
                  },
                  // activeColor: Colors.black,
                  // inactiveColor: Colors.black.withOpacity(0.3),
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  label: '${_slideItemA.toInt()}',
                )
              ],
            ),
            Text('SliderValue: $_slideItemA')
          ],
        ),
      ),
    );
  }
}
