import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  void _onTabHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabHandler,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.blue,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text('explore'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.slideshow),
          title: Text('slideshow'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.table_chart),
          title: Text('table_chart'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('person'),
        ),
      ],
    );
  }
}
