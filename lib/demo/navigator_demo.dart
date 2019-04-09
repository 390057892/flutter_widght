import 'package:flutter/material.dart';
import 'package:widght_flutter/constant/constant_router.dart';
class NavigatorDemo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('onclick'),
              onPressed: (){
                Navigator.pushNamed(context, Router().onClick);
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context)=>Page(title: 'About')
                //   ),
                // );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {

  final String title;

  Page({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}