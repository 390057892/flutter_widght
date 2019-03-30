import 'package:flutter/material.dart';
import '../demo/listview_demo.dart';

import '../demo/basic_demo.dart';
import '../demo/layout_demo.dart';
import '../demo/view_demo.dart';

class HomePageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
           leading:IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'menu',
              onPressed: ()=>Scaffold.of(context).openDrawer(),
            ),
          title: Text('flutter material'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () => debugPrint('search press'),
            ),
          ],
          elevation: 4.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.gradient)),
              Tab(icon: Icon(Icons.photo_library)),
              Tab(icon: Icon(Icons.view_quilt))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            ViewDemo(),
          ],
        ),
      ),
    );
  }
}
