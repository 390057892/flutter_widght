import 'package:flutter/material.dart';
import 'package:widght_flutter/constant/constant_router.dart';
import 'package:widght_flutter/demo/http/http_demo.dart';
import 'package:widght_flutter/demo/rxdart/rxdart_demo.dart';
import 'package:widght_flutter/demo/state/state_management.dart';
import 'package:widght_flutter/demo/stream/stream_demo.dart';
import 'demo/home_page_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/form_demo.dart';
import 'demo/material_components.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( //主题
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //选中高亮颜色
          splashColor: Colors.white70, //水波纹颜色
          platform: TargetPlatform.iOS),
      // home: HomePageDemo(),
      initialRoute: Router().http,
      routes: {
        Router().initRoute: (context) => HomePageDemo(),
        Router().onClick: (context) => Page(title: "OnClick",),
        Router().form:(context)=>FormDemo(),
        Router().mdc:(context)=>MatericalComponents(),
        Router().stateManagement:(context)=>StateManagementDemo(),
        Router().stream:(context)=>StreamDemo(),
        Router().rxdart:(context)=>RxDartDemo(),
        Router().http:(context)=>HttpDemo()
      },
    );
  }
}
