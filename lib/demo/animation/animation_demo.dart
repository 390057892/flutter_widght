import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animationController.addListener(() {
      setState(() {});
    });
//    animationController.addStatusListener((AnimationStatus status) {
//      print(status);
//    });
//    animationController.forward();
    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
    animation = Tween(begin: 32.0, end: 100.0).animate(curvedAnimation);
    animationColor = ColorTween(begin: Colors.red, end: Colors.red[900])
        .animate(curvedAnimation);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimationHeart(
          animations: [animation, animationColor],
          controller: animationController),
    );
  }
}

class AnimationHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimationHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
        icon: Icon(
          Icons.favorite,
          color: animations[1].value,
        ),
        iconSize: animations[0].value,
        onPressed: () {
          switch (controller.status) {
            case AnimationStatus.completed:
              controller.reverse();
              break;
            default:
              controller.forward();
              break;
          }
        });
  }
}
