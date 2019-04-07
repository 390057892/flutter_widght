import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PageBuilderDemo(
                  posts: posts,
                  index: index,
                )));
      },
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
      itemBuilder: _itemBuilder,
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

//动态pageview
class PageBuilderDemo extends StatelessWidget {
  final List<Post> posts;
  final int index;
  PageBuilderDemo({@required this.posts, @required this.index});
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.network(posts[index].imageUrl, fit: BoxFit.contain),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${index + 1} / ${posts.length}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.white)),
                  // Text(posts[index].author,style: TextStyle(fontSize: 32.0,color: Colors.white),)
                ],
              ),
            ],
          )
        ],
      ),
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

//固定gridview
class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _itemBuilder(int length) {
      return List.generate(length, (int index) {
        return Container(
          color: Colors.green[100],
          alignment: Alignment(0.0, 0.0),
          child: Text('Item $index'),
        );
      });
    }

    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10),
        children: _itemBuilder(50));
  }
}

//限制长度gridview
class GridViewExtDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _itemBuilder(int length) {
      return List.generate(length, (int index) {
        return Container(
          color: Colors.green[100],
          alignment: Alignment(0.0, 0.0),
          child: Text('Item $index'),
        );
      });
    }

    return GridView.extent(
        maxCrossAxisExtent: 100,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        children: _itemBuilder(50));
  }
}

//动态gridview
