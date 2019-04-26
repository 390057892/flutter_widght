import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  image: DecorationImage(
                    image: NetworkImage('https://resources.ninghao.org/images/candy-shop.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.blue[100].withOpacity(0.3),
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
        );
  }
}