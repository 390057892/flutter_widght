import 'package:flutter/material.dart';
import 'package:widght_flutter/model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text('SliverAppBar'),
            // pinned: true,
            // floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('FlexibleSpaceBar',style: TextStyle(
                fontSize: 12.0,
                letterSpacing: 3.0,
                fontWeight: FontWeight.w400
              ),),
              background: Image.network(posts[1].imageUrl,fit: BoxFit.cover,),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(10.0),
              sliver: SliverListDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.0),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        );
      }, childCount: posts.length),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(10.0),
          child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 14.0,
              shadowColor: Colors.blue,
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0)
                      ),
                      child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                    )
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(posts[index].title,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontStyle: FontStyle.italic)),
                        Text(posts[index].author,
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.white,
                                fontStyle: FontStyle.italic))
                      ],
                    ),
                  )
                ],
              )),
        );
      }, childCount: posts.length),
    );
  }
}
