import 'package:flutter/material.dart';
import 'package:widght_flutter/demo/bloc/bloc_demo.dart';
import '../demo/drawer_demo.dart';
import '../view/fitst_page.dart';
import '../demo/sliver_demo.dart';
import '../demo/material_components.dart';

class HomePageDemo extends StatefulWidget {
  @override
  _HomePageDemoState createState() => _HomePageDemoState();
}

class _HomePageDemoState extends State<HomePageDemo> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FirstPage(),
    SliverDemo(),
    MatericalComponents(),
    BlocDemo()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(Icons.table_chart),
              title: Text('table'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('person'),
            ),
          ],
        ));
  }

  void _onTabHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
