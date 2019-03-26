import 'package:flutter/material.dart';
import 'demo/listview_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
          //主题
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //选中高亮颜色
          splashColor: Colors.white70), //水波纹颜色
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('yellow theme'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () => debugPrint('search press'),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'more',
              onPressed: () => debugPrint('more press'),
            ),
          ],
          elevation: 4.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(
                icon: Icon(Icons.directions_bike),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.local_florist, size: 128, color: Colors.black12),
            Icon(Icons.change_history, size: 128, color: Colors.black12),
            Icon(Icons.directions_bike, size: 128, color: Colors.black12),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('zlj',style:TextStyle(fontWeight:FontWeight.bold)),
                accountEmail: Text('390057892@QQ.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553619675767&di=49d3918b21879df6d8c0102087fa2139&imgtype=0&src=http%3A%2F%2Fimage.yy.com%2Fyywebalbumbs2bucket%2F23b7ba35078a4505bc2bec90940a80e0_1487720650500.jpg'),
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow[300],
                  image: DecorationImage(
                    image: NetworkImage('http://img3.imgtn.bdimg.com/it/u=324338158,3143901995&fm=200&gp=0.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.yellow[300].withOpacity(0.6),
                      BlendMode.hardLight)
                  )
                ),
              ),
              ListTile(
                title: Text('message', textAlign: TextAlign.left),
                trailing:
                    Icon(Icons.message, size: 22.0, color: Colors.black12),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('favorite', textAlign: TextAlign.left),
                trailing:
                    Icon(Icons.favorite, size: 22.0, color: Colors.black12),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('settings', textAlign: TextAlign.left),
                trailing:
                    Icon(Icons.settings, size: 22.0, color: Colors.black12),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
