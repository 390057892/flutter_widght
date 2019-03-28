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
          icon: Icon(Icons.history),
          title: Text('history'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text('list'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('person'),
        ),
      ],
    );
  }
}
