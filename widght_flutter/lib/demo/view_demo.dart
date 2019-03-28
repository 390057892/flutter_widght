import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 10.0,
          left: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(posts[index].title,style:TextStyle(fontWeight:FontWeight.bold)),
              Text(posts[index].author)
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

//固定pageview
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: true, //滚动后超一半后是否自动到下一页
      // reverse: true, //翻转数据
      // scrollDirection: Axis.vertical, //滚动方向
      // onPageChanged: (currentPage)=>debugPrint('page is $currentPage'),//滚动监听
      controller: PageController(
          initialPage: 3, //初始页数
          keepPage: false, //是否保存状态
          viewportFraction: 0.85 //页面占用比
          ),
      children: <Widget>[
        Container(
          color: Colors.green[100],
          alignment: Alignment(0, 0),
          child: Text('ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.pink[100],
          alignment: Alignment(0, 0),
          child: Text('TWO',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.blueGrey[100],
          alignment: Alignment(0, 0),
          child: Text('THREE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
      ],
    );
  }
}
