import 'package:flutter/material.dart';
import 'package:widght_flutter/demo/home_page_demo.dart';

class SplashDemo extends StatefulWidget {
  @override
  _SplashDemoState createState() => _SplashDemoState();
}

class _SplashDemoState extends State<SplashDemo> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomePageDemo()));
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition( //透明度组件
      opacity: _animation,
      child: Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556279333281&di=b1b9b42e3f9c5d6c57a680b96685d163&imgtype=0&src=http%3A%2F%2Fpic.97uimg.com%2Fapp_pic%2F00%2F00%2F01%2F01%2Ff45eb5cbb99cf0baaa5c39592a6741a5.jpg', fit: BoxFit.cover,),
    );
  }
}
