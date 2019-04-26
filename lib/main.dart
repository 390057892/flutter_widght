import 'package:flutter/material.dart';
import 'package:widght_flutter/constant/constant_router.dart';
import 'package:widght_flutter/demo/animation/animation_demo.dart';
import 'package:widght_flutter/demo/http/http_demo.dart';
import 'package:widght_flutter/demo/i18n/i18n_demo.dart';
import 'package:widght_flutter/demo/rxdart/rxdart_demo.dart';
import 'package:widght_flutter/demo/splash_demo.dart';
import 'package:widght_flutter/demo/state/state_management.dart';
import 'package:widght_flutter/demo/stream/stream_demo.dart';
import 'demo/home_page_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/form_demo.dart';
import 'demo/material_components.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:widght_flutter/demo/i18n/map/localizations_demo.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      locale: Locale('zh','CN'),
//      locale: Locale('en','US'),
      localeResolutionCallback: (Locale local,Iterable<Locale> supportedLocales){
        return Locale('en','US');
      },
      localizationsDelegates: [
        LocalizationsDelegateDemo(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en','US'),
        Locale('zh','CN'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData( //主题
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //选中高亮颜色
          splashColor: Colors.white70, //水波纹颜色
          platform: TargetPlatform.iOS),
//       home: SplashDemo(),
      initialRoute: Router().i18n,
      routes: {
        Router().initRoute: (context) => HomePageDemo(),
        Router().onClick: (context) => Page(title: "OnClick",),
        Router().form:(context)=>FormDemo(),
        Router().mdc:(context)=>MatericalComponents(),
        Router().stateManagement:(context)=>StateManagementDemo(),
        Router().stream:(context)=>StreamDemo(),
        Router().rxdart:(context)=>RxDartDemo(),
        Router().http:(context)=>HttpDemo(),
        Router().animation:(context)=>AnimationDemo(),
        Router().i18n:(context)=>I18nDemo(),
      },
    );
  }
}
