import 'package:flutter/material.dart';
import 'package:widght_flutter/constant/constant_router.dart';
import 'demo/home_page_demo.dart';
import 'demo/navigator_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( //主题
          primarySwatch: Colors.blue,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //选中高亮颜色
          splashColor: Colors.white70, //水波纹颜色
          platform: TargetPlatform.iOS),
      // home: HomePageDemo(),
      initialRoute: Router().initRoute,
      routes: {
        Router().initRoute: (context) => HomePageDemo(),
        Router().onClick: (context) => Page(
              title: "OnClick",
            ),
      },
    );
  }
}
