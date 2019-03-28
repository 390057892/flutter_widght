import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, //主轴
        children: <Widget>[StackDemo()]);
  }
}

//stack层叠部件简单使用
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          child: Container(
            width: 200.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(
          height: 32.0,
        ),
        SizedBox(
          child: Container(
            width: 50.0,
            height: 50.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [Colors.white, Colors.blue])),
            child: Icon(Icons.wb_sunny, color: Colors.white, size: 32.0),
          ),
        ),
        Positioned(
          right: 40.0,
          top: 130.0,
          child: Icon(Icons.cloud, color: Colors.white, size: 32.0),
        ),
        Positioned(
          right: 30.0,
          top: 30.0,
          child: Icon(Icons.cloud, color: Colors.white, size: 32.0),
        ),
        Positioned(
          right: 80.0,
          top: 90.0,
          child: Icon(Icons.cloud, color: Colors.white, size: 32.0),
        ),
        Positioned(
          right: 110.0,
          top: 180.0,
          child: Icon(Icons.cloud, color: Colors.white, size: 32.0),
        ),
      ],
    );
  }
}

//通用IconBadge简单使用
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60,
      height: size + 60,
      color: Colors.blue,
    );
  }
}

//AspectRatioDemo
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}

//ConstrainedBoxDemo
class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 100,
        maxWidth: 100
      ),
       child: Container(
        color: Colors.blue,
      ),
    );
  }
}