import 'package:flutter/material.dart';
import 'model/post.dart';
void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        theme: ThemeData(primarySwatch: Colors.yellow));
  }
}
class Home extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context,int index){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          SizedBox(height: 16.0,),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.title,
          ),
           Text(
            posts[index].author,
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(height: 16.0,)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text('yellow theme'),
            elevation: 4.0,
          ),
          body: ListView.builder(
            itemCount: posts.length,
            itemBuilder: _listItemBuilder,
          ),
        );
  }
}



class hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'hello',
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
